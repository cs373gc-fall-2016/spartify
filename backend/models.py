"""
  Models file that contains DB Model classes and tabel definitions
"""

from db import db
from sqlalchemy import func, or_, cast, String

"""
    project_participation is table that captures the many-to-many relationship
    between contributors and projects
"""
project_participation = db.Table('project_participation',
                                 db.Column('contributor_id', db.Integer,
                                           db.ForeignKey('contributors.id')),
                                 db.Column('project_id', db.Integer,
                                           db.ForeignKey('projects.id'))
                                 )

"""
    language_usage is table that captures the many-to-many relationship
    between languages and projects
"""
language_usage = db.Table('language_usage',
                          db.Column('language_id', db.Integer,
                                    db.ForeignKey('languages.id')),
                          db.Column('project_id', db.Integer,
                                    db.ForeignKey('projects.id'))
                          )

"""
    company_membership is table that captures the many-to-many relationship
    between companies and contributors
"""
company_membership = db.Table('company_membership',
                              db.Column('company_id', db.Integer,
                                        db.ForeignKey('companies.id')),
                              db.Column('contributor_id', db.Integer,
                                        db.ForeignKey('contributors.id'))
                              )
"""
    company_membership is table that captures the many-to-many relationship
    between languages and paradigms
"""
paradigms_used = db.Table('paradigms_used',
                          db.Column('language_id', db.Integer,
                                    db.ForeignKey('languages.id')),
                          db.Column('paradigm_id', db.Integer,
                                    db.ForeignKey('paradigms.id'))
                          )


class Contributor(db.Model):
    """ 
    A contributor represents a person who has contributed to a project
    """
    __tablename__ = 'contributors'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String)
    email = db.Column(db.String)
    url = db.Column(db.String)
    avatar_url = db.Column(db.String)
    location = db.Column(db.String)

    def __init__(self, username, email, url, avatar_url, location):
        self.username = username
        self.email = email
        self.url = url
        self.avatar_url = avatar_url
        self.location = location

    def __repr__(self):
        return '<Contributor %r>' % self.username

    @staticmethod
    def column_queries(tokens):
        column_queries = []
        for token in tokens:
            column_queries.append(or_(func.lower(Contributor.username).like(token),
                                      func.lower(
                                          Contributor.email).like(token),
                                      func.lower(Contributor.url).like(token),
                                      func.lower(
                                          Contributor.avatar_url).like(token),
                                      func.lower(Contributor.location).like(token)))
        return column_queries

    def dictionary(self):
        cdict = {}
        cdict['id'] = self.id
        cdict['username'] = self.username
        cdict['email'] = self.email
        cdict['url'] = self.url
        cdict['avatar_url'] = self.avatar_url
        cdict['location'] = self.location
        projects = list(self.projects)
        companies = list(self.companies)
        if projects:
            cdict['project_ids'] = [p.id for p in projects]
        if companies:
            cdict['company_ids'] = [c.id for c in companies]
        return cdict


class Paradigm(db.Model):
    """
    A paradigm represents a programming paradigm (object oriented, functional, etc.)
    """
    __tablename__ = 'paradigms'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=True)

    def __init__(self, name):
        self.name = name

    def __repr__(self):
        return '<Paradigm %r>' % self.name


class Language(db.Model):
    """
    A Language represents a programming language
    """
    __tablename__ = 'languages'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=True)
    creator = db.Column(db.String)
    type = db.Column(db.String)
    firstAppeared = db.Column(db.Integer)
    description = db.Column(db.String)
    paradigms = db.relationship('Paradigm', secondary=paradigms_used,
                                backref=db.backref('languages', lazy='dynamic'))

    def __init__(self, name, creator, type, firstAppeared, description):
        self.name = name
        self.creator = creator
        self.type = type
        self.firstAppeared = firstAppeared
        self.description = description

    def __repr__(self):
        return '<Language %r>' % self.name

    @staticmethod
    def column_queries(tokens):
        column_queries = []
        for token in tokens:
            column_queries.append(or_(func.lower(Language.name).like(token),
                                      func.lower(Language.creator).like(token),
                                      func.lower(Language.type).like(token),
                                      cast(Language.firstAppeared,
                                           String).like(token),
                                      func.lower(Language.description).like(token)))
        return column_queries

    def dictionary(self):
        ldict = {}
        ldict['id'] = self.id
        ldict['name'] = self.name
        ldict['creator'] = self.creator
        ldict['description'] = self.description
        ldict['type'] = self.type
        ldict['firstAppeared'] = self.firstAppeared
        projects = list(self.projects)
        paradigms = list(self.paradigms)
        if projects:
            ldict['project_ids'] = [p.id for p in projects]
        if paradigms:
            ldict['paradigms'] = [p.name for p in paradigms]
        return ldict


class Project(db.Model):
    """
    A Project represents an opensource project
    """
    __tablename__ = 'projects'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String)
    url = db.Column(db.String)
    createdDate = db.Column(db.DateTime)
    private = db.Column(db.Boolean)
    owner_id = db.Column(db.Integer, db.ForeignKey('companies.id'))
    description = db.Column(db.String)
    languages = db.relationship('Language', secondary=language_usage,
                                backref=db.backref('projects', lazy='dynamic'))
    contributors = db.relationship('Contributor', secondary=project_participation,
                                   backref=db.backref('projects', lazy='dynamic'))

    def __init__(self, name, url, createdDate, description, private):
        self.name = name
        self.url = url
        self.createdDate = createdDate
        self.description = description
        self.private = private

    def __repr__(self):
        return '<Project %r>' % self.name

    @staticmethod
    def column_queries(tokens):
        column_queries = []
        for token in tokens:
            column_queries.append(or_(func.lower(Project.name).like(token),
                                      func.lower(Project.url).like(token),
                                      func.lower(
                                          cast(Project.createdDate, String)).like(token),
                                      func.lower(
                                          cast(Project.private, String)).like(token),
                                      func.lower(Project.description).like(token)))
        return column_queries

    def dictionary(self):
        pdict = {}
        pdict['id'] = self.id
        pdict['name'] = self.name
        pdict['url'] = self.url
        pdict['description'] = self.description
        pdict['createdDate'] = self.createdDate
        pdict['private'] = self.private
        languages = list(self.languages)
        contributors = list(self.contributors)
        if languages:
            pdict['language_ids'] = [l.id for l in languages]
        if contributors:
            pdict['contributor_ids'] = [c.id for c in contributors]
        pdict['owner_id'] = self.owner_id
        return pdict


class Company(db.Model):
    """
    A Company represents an owner of a project
    """
    __tablename__ = 'companies'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=True)
    email = db.Column(db.String)
    url = db.Column(db.String)
    avatar_url = db.Column(db.String)
    description = db.Column(db.String, unique=True)
    projects = db.relationship('Project', backref='company', lazy='dynamic')
    members = db.relationship('Contributor', secondary=company_membership,
                              backref=db.backref('companies', lazy='dynamic'))

    def __init__(self, name, email, url, avatar_url, description):
        self.name = name
        self.email = email
        self.url = url
        self.avatar_url = avatar_url
        self.description = description

    def __repr__(self):
        return '<Company %r>' % self.name

    @staticmethod
    def column_queries(tokens):
        column_queries = []
        for token in tokens:
            column_queries.append(or_(func.lower(Company.name).like(token),
                                      func.lower(Company.email).like(token),
                                      func.lower(Company.url).like(token),
                                      func.lower(
                                          Company.avatar_url).like(token),
                                      func.lower(Company.description).like(token)))
        return column_queries

    def dictionary(self):
        cdict = {}
        cdict['id'] = self.id
        cdict['name'] = self.name
        cdict['email'] = self.email
        cdict['url'] = self.url
        cdict['avatar_url'] = self.avatar_url
        cdict['description'] = self.description
        projects = list(self.projects)
        members = list(self.members)
        if projects:
            cdict['project_ids'] = [p.id for p in projects]
        if members:
            cdict['member_ids'] = [c.id for c in members]
        return cdict
