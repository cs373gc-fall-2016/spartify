from flask import Flask, render_template, url_for, jsonify, abort
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

resources = {
    'contributors': 'id',
    'projects': 'id',
    'languages': 'name',
    'companies': 'id'}

@app.route('/api/<resource>/')
@app.route('/api/<resource>/<id>')
def resource(resource, id=None):
    if resource in resources:
        model = getattr(models, resource[:-1].title())
        if id is None:
            return jsonify([create_dict(c) for c in model.query.all()])
        data = model.query.filter_by(**{resources[resource]: id}).first()
        if data is None:
            abort(404)
        return jsonify(create_dict(data))
    abort(404)


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
