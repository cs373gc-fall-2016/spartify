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
    return jsonify([create_dict(c) for c in dbs[db_name].query.all()])

@app.route('/api/contributors/<id>')
def contributor(id):
    """
    returns json for the contributor with the given id
    """
    contributor = Contributor.query.filter_by(id=id).first()
    if contributor == None:
        abort(404)
    return jsonify(create_dict(contributor))

@app.route('/api/projects/<id>')
def probejct(id):
    """
    returns json for the project with the given id
    """
    project = Project.query.filter_by(id=id).first()
    if project == None:
        abort(404)
    return jsonify(create_dict(project))

@app.route('/api/languages/<id>')
def language(id):
    """
    retuns json for the language with the given name
    """
    language = Language.query.filter_by(id=id).first()
    if language == None:
        abort(404)
    return jsonify(create_dict(language))

@app.route('/api/companies/<id>')
def company(id):
    """
    returns json of for the company with the given id
    """
    company = Company.query.filter_by(id=id).first()
    if company == None:
        abort(404)
    return jsonify(create_dict(company))


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


def create_dict(obj):
    """
    calls the obj.dictionary() and returns the result
    """
    return obj.dictionary()
#    return {}

if __name__ == "__main__":
    manager.run()
