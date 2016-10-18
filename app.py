
from flask import Flask, render_template, url_for, jsonify, abort
from flask_sqlalchemy import SQLAlchemy
from flask_script import Manager, Shell

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://localhost/opensourcery'
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

company_membership = db.Table('company_membership',
    db.Column('company_id', db.Integer, db.ForeignKey('companies.id')),
    db.Column('contributor_id', db.Integer, db.ForeignKey('contributors.id'))
)

paradigms_used = db.Table('paradigms_used',
    db.Column('language_id', db.Integer, db.ForeignKey('languages.id')),
    db.Column('paradigm_id', db.Integer, db.ForeignKey('paradigms.id'))
)

class Contributor(db.Model):
    __tablename__ = 'contributors'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String)
    email = db.Column(db.String)
    url = db.Column(db.String)

    def __init__(self, username, email, url):
        self.username = username
        self.email=email
        self.url = url

    def __repr__(self):
        return '<Contributor %r>' % self.username

    def dictionary(self):
        cdict = {}
        cdict['id'] = self.id
        cdict['username'] = self.username
        cdict['email'] = self.email
        cdict['url'] = self.url
        projects = list(self.projects)
        companies = list(self.companies)
        if projects:
            cdict['project_ids'] = [p.id for p in projects]
        if companies:
            cdict['company_ids'] = [c.di for c in companies]
        return cdict

class Paradigm(db.Model):
    __tablename__ = 'paradigms'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=True)

    def __init__(self, name):
      self.name = name

    def __repr__(self):
      return '<Paradigm %r>' % self.name

class Language(db.Model):
    __tablename__ = 'languages'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=True)
    creator = db.Column(db.String)
    description = db.Column(db.String)
    paradigms = db.relationship('Paradigm', secondary=paradigms_used,
        backref=db.backref('languages', lazy='dynamic'))

    def __init__(self, name, creator, description):
        self.name = name
        self.creator = creator
        self.description = description

    def __repr__(self):
        return '<Language %r>' % self.name

    def dictionary(self):
        ldict = {}
        ldict['name'] = self.name
        ldict['creator'] = self.creator
        ldict['description'] = self.description
        projects = list(self.projects)
        paradigms = list(self.paradigms)
        if projects:
            ldict['project_ids'] = [p.id for p in projects]
        if paradigms:
            ldict['paradigms'] = [p.name for p in paradigms]
        return ldict

class Project(db.Model):
    __tablename__ = 'projects'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String)
    url = db.Column(db.String)
    owner_id = db.Column(db.Integer, db.ForeignKey('companies.id'))
    description = db.Column(db.String)
    languages = db.relationship('Language', secondary=language_usage,
        backref=db.backref('projects', lazy='dynamic'))
    contributors = db.relationship('Contributor', secondary=project_participation,
        backref=db.backref('projects', lazy='dynamic'))

    def __init__(self, name, url, description):
        self.name = name
        self.url = url
        self.description = description

    def __repr__(self):
        return '<Project %r' % self.name

    def dictionary(self):
        pdict = {}
        pdict['id'] = self.id
        pdict['name'] = self.name
        pdict['url'] = self.url
        languages = list(self.languages)
        contributors = list(self.contributors)
        if languages:
            pdict['languages'] = [l.name for l in languages]
        if contributors:
            pdict['contributor_ids'] = [c.id for c in contributors]
        pdict['owner_id'] = self.owner_id
        return pdict

class Company(db.Model):
    __tablename__ = 'companies'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=True)
    url = db.Column(db.String)
    description = db.Column(db.String, unique=True)
    projects = db.relationship('Project', backref='company', lazy='dynamic')
    members = db.relationship('Contributor', secondary=company_membership,
        backref=db.backref('companies', lazy='dynamic'))

    def __init__(self, name, url, description):
        self.name = name
        self.url = url
        self.description = description

    def __repr__(self):
        return '<Company %r>' % self.name

    def dictionary(self):
        cdict = {}
        cdict['id'] = self.id
        cdict['name'] = self.name
        cdict['url'] = self.url
        cdict['description'] = self.description
        projects = list(self.projects)
        members = list(self.members)
        if projects:
            cdict['project_ids'] = [p.id for p in projects]
        if members:
            cdict['member_ids'] = [c.id for c in members]
        return cdict


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
