
from flask import Flask, render_template, url_for, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_script import Manager, Shell

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://localhost/opensorcery'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
manager = Manager(app)

project_participation = db.Table('project_participation',
    db.Column('contributor_id', db.Integer, db.ForeignKey('contributors.id')),
    db.Column('project_id', db.Integer, db.ForeignKey('projects.id'))
)

language_usage = db.Table('language_usage',
    db.Column('language_id', db.Integer, db.ForeignKey('languages.id')),
    db.Column('project_id', db.Integer, db.ForeignKey('projects.id'))
)

class Contributor(db.Model):
  __tablename__ = 'contributors'
  id = db.Column(db.Integer, primary_key=True)
  username = db.Column(db.String(20), unique=True)
  email = db.Column(db.String(120), unique=True)

  def __init__(self, username, email):
    self.username = username
    self.email=email

  def __repr__(self):
    return '<Contributor %r>' % self.username

class Language(db.Model):
  __tablename__ = 'languages'
  id = db.Column(db.Integer, primary_key=True)
  name = db.Column(db.String(20), unique=True)
  description = db.Column(db.String(120), unique=True)

  def __init__(self, name, description):
    self.name = name
    self.description = description

  def __repr__(self):
    return '<Language %r>' % self.name

class Project(db.Model):
  __tablename__ = 'projects'
  id = db.Column(db.Integer, primary_key=True)
  name = db.Column(db.String(20), unique=True)
  createdDate = db.Column(db.DateTime(), unique=True)
  company_id = db.Column(db.Integer, db.ForeignKey('companies.id'))
  languages = db.relationship('Language', secondary=language_usage,
    backref=db.backref('projects', lazy='dynamic'))
  contributors = db.relationship('Contributor', secondary=project_participation,
    backref=db.backref('projects', lazy='dynamic'))

  def __init__(self, name, createdDate):
    self.name = name
    self.createdDate = createdDate

  def __repr__(self):
    return '<Project %r' % self.name

class Company(db.Model):
  __tablename__ = 'companies'
  id = db.Column(db.Integer, primary_key=True)
  name = db.Column(db.String(20), unique=True)
  description = db.Column(db.String(120), unique=True)
  projects = db.relationship('Project', backref='company', lazy='dynamic')

  def __init__(self, name, description):
    self.name = name
    self.description = description

  def __repr__(self):
    return '<Company %r>' % self.name


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/contributors/')
def contributors():
    contributors = Contributor.query.all()
    return jsonify(contributors)

@app.route('/contributors/<username>')
def contributor(username):
    contributor = Project.query.filter_by(username=username).first()
    return jsonify(contributor)

@app.route('/projects/')
def projects():
    projects = Project.query.all()
    return jsonify(projects)

@app.route('/projects/<name>')
def probejct(name):
    project = Project.query.filter_by(name=name).first()
    return jsonify(project)

@app.route('/languages/')
def languages():
    languages = Language.query.all()
    return jsonify(languages)

@app.route('/languages/<name>')
def language(name):
    language = Language.query.filter_by(name=name).first()
    return jsonify(language)

@app.route('/companies/')
def companies():
    companies = Company.query.all()
    return jsonify(companies)

@app.route('/companies/<name>')
def company(name):
    company = Company.query.filter_by(name=name).first()
    return jsonify(company)

def shell_context():
	context = {
        'app': app,
        'db': db,
        'Contributor': Contributor,
        'Language': Language,
        'Project': Project,
        'Company': Company
	}
	return context

manager.add_command('shell', Shell(make_context=shell_context))

if __name__ == "__main__":
    manager.run()
