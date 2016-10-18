from flask import Flask, render_template, url_for, jsonify, abort
from flask_sqlalchemy import SQLAlchemy
from flask_script import Manager, Shell
from db import db, app, manager
from models import Contributor, Paradigm, Language, Project, Company

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/api/contributors/')
def contributors():
    contributors = Contributor.query.all()
    return jsonify([create_dict(c) for c in contributors])

@app.route('/api/contributors/<id>')
def contributor(id):
    contributor = Project.query.filter_by(id=id).first()
    if contributor == None:
        abort(404)
    return jsonify(create_dict(contributor))

@app.route('/api/projects/')
def projects():
    projects = Project.query.all()
    return jsonify([create_dict(p) for p in projects])

@app.route('/api/projects/<id>')
def probejct(id):
    project = Project.query.filter_by(id=id).first()
    if project == None:
        abort(404)
    return jsonify(create_dict(project))

@app.route('/api/languages/')
def languages():
    languages = Language.query.all()
    return jsonify([create_dict(l) for l in languages])

@app.route('/api/languages/<name>')
def language(name):
    language = Language.query.filter_by(name=name.lower()).first()
    if language == None:
        abort(404)
    return jsonify(create_dict(language))

@app.route('/api/companies/')
def companies():
    companies = Company.query.all()
    return jsonify([create_dict(c) for c in companies])

@app.route('/api/companies/<id>')
def company(id):
    company = Company.query.filter_by(id=id).first()
    if company == None:
        abort(404)
    return jsonify(create_dict(company))

@app.errorhandler(404)
def resource_not_found(e):
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
    return obj.dictionary()
#    return {}

if __name__ == "__main__":
    manager.run()
