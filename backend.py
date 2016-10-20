from flask import Flask, render_template, url_for, jsonify, abort
from flask_sqlalchemy import SQLAlchemy
from flask_script import Manager, Shell
from db import db, app, manager
from models import Contributor, Paradigm, Language, Project, Company

"""
"""

# ---------------
# index 
# ---------------]

@app.route('/')
def index():
    """ 
    renders the landing page
    """
    return render_template('index.html')

@app.route('/languages/')
def lang_temp():
    """ 
      renders the language page
    """ 
    languages = Language.query.all()
    return render_template('languages.html', languages=languages)

@app.route('/languages/<name>')
def lang_tmp(name):
    language = Language.query.filter_by(name=name.lower()).first()
    return render_template('language.html', language=language)

@app.route('/companies/')
def comp_temp():
    companies = Company.query.all()
    return render_template('companies.html', companies=companies)

@app.route('/companies/<id>')
def comp_tmp(id):
    company = Company.query.filter_by(id=id).first()
    return render_template('company.html', company=company)

@app.route('/contributors/')
def contr_temp():
    contributors = Contributor.query.all()
    return render_template('contributors.html', contributors=contributors)

@app.route('/contributors/<id>')
def contr_tmp(id):
    contributor = Contributor.query.filter_by(id=id).first()
    return render_template('contributor.html', contributor=contributor)

@app.route('/projects/')
def proj_temp():
    projects = Project.query.all()
    return render_template('projects.html', projects=projects)

@app.route('/projects/<id>')
def proj_tmp(id):
    project = Project.query.filter_by(id=id).first()
    return render_template('project.html', project=project)

@app.route('/About/')
def about_temp():
    return render_template('about.html')

@app.route('/api/contributors/')
def contributors():
    contributors = Contributor.query.all()
    return jsonify([create_dict(c) for c in contributors])

@app.route('/api/contributors/<id>')
def contributor(id):
    contributor = Contributor.query.filter_by(id=id).first()
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
