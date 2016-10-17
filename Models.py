project_participation = db.Table('ProjectParticipation',
    db.Column('contributor_id', db.Integer, db.ForeignKey('Contributor.id')),
    db.Column('project_id', db.Integer, db.ForeignKey('Project.id'))
)

language_usage = db.Table('LanguageUsage',
    db.Column('language_id', db.Integer, db.ForeignKey('Language.id')),
    db.Column('project_id', db.Integer, db.ForeignKey('Project.id'))
)

class Contributor(db.Model):
  id = db.Column(db.Integer, primary_key=True)
  username = db.Column(db.String(20), unique=True)
  email = db.Column(db.String(120), unique=True)

  def __init__(self, username, email):
    self.username = username
    self.email=email

  def __repr__(self):
    return '<Contributor %r>' % self.username

class Language(db.Model)
  id = db.Column(db.Integer, primary_key=True)
  name = db.Column(db.String(20), unique=True)
  description = db.Column(db.String(120), unique=True)

  def __init__(self, name, description):
    self.name = name
    self.description = description

  def __repr__(self):
    return '<Language %r>' % self.name

class Project(db.Model)
  id = db.Column(db.Integer, primary_key=True)
  name = db.Column(db.String(20), unique=True)
  createdDate = db.Column(db.DateTime(), unique=True)
  company_id = db.Column(db.Integer, db.ForeignKey('Company.id'))
  languages = db.relationship('Language', secondary=language_usage,
    backref=db.backref('projects', lazy='dynamic'))
  contributors = db.relationship('Contributor', secondary=project_participation,
    backref=db.backref('projects', lazy='dynamic'))

  def __init__(self, name, createdDate):
    self.name = name
    self.createdDate = createdDate

  def __repr__(self):
    return '<Project %r' % self.name

class Company(db.Model)
  id = db.Column(db.Integer, primary_key=True)
  name = db.Column(db.String(20), unique=True)
  description = db.Column(db.String(120), unique=True)
  projects = db.relationship('Project', backref='company', lazy='dynamic')

  def __init__(self, name, description):
    self.name = name
    self.description = description

  def __repr__(self):
    return '<Company %r>' % self.name
