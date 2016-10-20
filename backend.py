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
    companies = Company.query.all()
    return render_template('index.html', companies=companies)


@app.route('/languages/')
def lang_temp():
    """ 
    renders the languages page
    """
    languages = Language.query.all()
    return render_template('languages.html', languages=languages)


@app.route('/languages/<name>')
def lang_tmp(name):
    """ 
    renders the page for the given language
    """
    language = Language.query.filter_by(name=name.lower()).first()
    return render_template('language.html', language=language)


@app.route('/companies/')
def comp_temp():
    """ 
    renders the companies page
    """
    companies = Company.query.all()
    return render_template('companies.html', companies=companies)


@app.route('/companies/<id>')
def comp_tmp(id):
    """ 
    renders the page for the company with the given id
    """
    company = Company.query.filter_by(id=id).first()
    return render_template('company.html', company=company)


@app.route('/contributors/')
def contr_temp():
    """ 
      renders the contributors page
    """
    contributors = Contributor.query.all()
    return render_template('contributors.html', contributors=contributors)


@app.route('/contributors/<id>')
def contr_tmp(id):
    """ 
    renders the page for the contributor with the given id
    """
    contributor = Contributor.query.filter_by(id=id).first()
    return render_template('contributor.html', contributor=contributor)


@app.route('/projects/')
def proj_temp():
    """ 
    renders the projects page
    """
    projects = Project.query.all()
    return render_template('projects.html', projects=projects)


@app.route('/projects/<id>')
def proj_tmp(id):
    """ 
    renders the page for the project with the given id
    """
    project = Project.query.filter_by(id=id).first()
    return render_template('project.html', project=project)


@app.route('/About/')
def about_temp():
    """ 
    renders the about page
    """
    return render_template('about.html')


@app.route('/api/contributors/')
def contributors():
    """ 
    returns a json list of all contributors 
    """
    contributors = Contributor.query.all()
    return jsonify([create_dict(c) for c in contributors])


@app.route('/api/contributors/<id>')
def contributor(id):
    """ 
    returns json for the contributor with the given id 
    """
    contributor = Contributor.query.filter_by(id=id).first()
    if contributor == None:
        abort(404)
    return jsonify(create_dict(contributor))


@app.route('/api/projects/')
def projects():
    """ 
    returns a json list of all projects 
    """
    projects = Project.query.all()
    return jsonify([create_dict(p) for p in projects])


@app.route('/api/projects/<id>')
def probejct(id):
    """ 
    returns json for the project with the given id 
    """
    project = Project.query.filter_by(id=id).first()
    if project == None:
        abort(404)
    return jsonify(create_dict(project))


@app.route('/api/languages/')
def languages():
    """ 
    returns a json list of all languages
    """
    languages = Language.query.all()
    return jsonify([create_dict(l) for l in languages])


@app.route('/api/languages/<name>')
def language(name):
    """ 
    retuns json for the language with the given name 
    """
    language = Language.query.filter_by(name=name.lower()).first()
    if language == None:
        abort(404)
    return jsonify(create_dict(language))


@app.route('/api/companies/')
def companies():
    """ 
    returns a json list of all companies 
    """
    companies = Company.query.all()
    return jsonify([create_dict(c) for c in companies])


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
