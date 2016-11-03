from flask import Flask, request, jsonify, abort, send_from_directory
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import func, desc
from flask_script import Manager, Shell
from db import db, app, manager
import subprocess
from models import Contributor, Paradigm, Language, Project, Company
import models

"""
"""

# ---------------
# index
# ---------------]


@app.route('/')
@app.route('/<path:path>')
def index(path = ""):
    """
    renders the landing page
    """
    return send_from_directory('..', 'index.html')

@app.route('/node_modules/<path:path>')
def send_nodemodules(path):
    return send_from_directory('../node_modules', path)

@app.route('/app/<path:path>')
def send_app(path):
    return send_from_directory('../app', path)

@app.route('/favicon.ico')
def send_favicon():
    return send_from_directory('..', 'favicon.ico')

@app.route('/system-config.js')
def send_systemconfig():
    return send_from_directory('..', 'system-config.js')

@app.route('/system-config.js.map')
def send_systemconfig_map():
    return send_from_directory('..', 'system-config.js.map')

@app.route('/runtests/')
def run_unit_tests():
    subprocess.check_output(["bash", "test.sh"])
    return send_from_directory('.', 'tests.html')

db_by_name = {
        "contributors": Contributor,
        "projects": Project,
        "languages": Language,
        "companies": Company
        }

@app.route('/api/count/<db_name>')
def model_count(db_name):
    if (db_name not in db_by_name):
        abort(404)
    return str(db_by_name[db_name].query.count())

@app.route('/api/<db_name>/')
def model_page(db_name, start=None, end=None, orderby=None, descending=None):
    """
    returns json list of items in database
    """
    start = request.args.get("start")
    end = request.args.get("end")
    orderby = request.args.get("orderby")
    descending = request.args.get("descending")
    if (start == None and end == None):
        if db_name not in db_by_name:
            abort(404)
        return jsonify([x.dictionary() for x in db_by_name[db_name].query.all()])
    elif (start != None and end != None):
        if (int(start) > int(end)):
            abort(404)
        if db_name not in db_by_name:
            abort(404)
        if (orderby != None and descending == "true"):
            result = db_by_name[db_name].query.order_by(desc(orderby)).limit(int(end) - int(start)).offset(int(start)).all()
            return jsonify([x.dictionary() for x in result])
        elif (orderby != None):
            result = db_by_name[db_name].query.order_by(orderby).limit(int(end) - int(start)).offset(int(start)).all()
            return jsonify([x.dictionary() for x in result])
        else:
            result = db_by_name[db_name].query.limit(int(end) - int(start)).offset(int(start)).all()
            return jsonify([x.dictionary() for x in result])
    else:
        abort(404)

@app.route('/api/<db_name>/<id>')
def single_model(db_name, id):
    """
    returns json for the database item with the given id
    """
    if db_name not in db_by_name:
        abort(404)
    ret = db_by_name[db_name].query.filter_by(id=id).first()
    if ret == None:
        abort(404)
    return jsonify(ret.dictionary())

@app.errorhandler(404)
def resource_not_found(e):
    """
    error handinging for a 'not found' error
    """
    return "Resource not found", 404

def shell_context():
    context = {
        'app': app,
        'db': db,
        'Contributor': Contributor,
        'Language': Language,
        'Project': Project,
        'Company': Company,
        'Paradigm': Paradigm
    }
    return context

manager.add_command('shell', Shell(make_context=shell_context))

if __name__ == "__main__":
    manager.run()
