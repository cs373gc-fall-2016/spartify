from flask import Flask, render_template, url_for, jsonify, abort, send_from_directory
from flask_sqlalchemy import SQLAlchemy
from flask_script import Manager, Shell
from db import db, app, manager
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

@app.route('/api/<db_name>/')
def model_page(db_name):
    """
    returns json list of items in database
    """
    dbs = {
            "contributors": Contributor,
            "projects": Project,
            "languages": Language,
            "companies": Company
            }
    if db_name not in dbs:
        abort(404)
    return jsonify([x.dictionary() for x in dbs[db_name].query.all()])

@app.route('/api/<db_name>/<id>')
def single_model(db_name, id):
    """
    returns json for the database item with the given id
    """
    dbs = {
            "contributors": Contributor,
            "projects": Project,
            "languages": Language,
            "companies": Company
            }
    if db_name not in dbs:
        abort(404)
    ret = dbs[db_name].query.filter_by(id=id).first()
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
