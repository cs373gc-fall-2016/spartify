import unittest
from flask.ext.testing import TestCase
from db import db, app
from models import Contributor, Paradigm, Company, Project, Languae

class TestModels(TestCase):

    def mock_app(self):
        app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://test.db'
        return app

    def setUp(self):
        db.create_all()
        paradigm = Paradigm(name='Functional')
        language = Language(name='tstLang', creator='bob', description='test')
        company = Company(name='TestCom', url="test.com/testcom", description='test')
        contributor = Contributor(username='testusr', email='testusr@test.com', url='test.com/testusr')
        project = Project('testProj', url='test.com/testproj', description='test')
        language.id = 1
        contributor.id = 2
        company.id = 3
        project.id = 4
        language.paradigms.append(paradigm)
        project.languages.append(language)
        project.company = company
        project.contributors.append(contributor)
        company.members.append(contributor)

        db.session.add(project)
        db.session.commit()
    
    def tearDown():
        db.session.remove()
        db.drop_all()

    def testGetAllLanguages(self):
        languages = Language.query.all()
        self.assertEqual(len(languages) == 1)

    def testGetSpecificLanguage(self):
        language = Language.query.filter_by(name='tstLang').first()
        paradigm = language.paradigms[0]
        self.assertEqual(language.name,'tstLang')
        self.assertEqual(language.creator,'bob')
        self.assertEqual(language.description, 'test')
        self.assertEqual(len(language.paradigms), 1)
        self.assertEqual(paradigm.name, 'Functional')


    def testGetAllContributors(self):
        contributors = Contributor.query.all()
        self.asserEqual(len(contributors), 1)

    def testGetSpecificContributor(self):
        contributor = Contributor.query.filter_by(id=2)
        self.assertEqual(contributor.name, 'testusr')
        self.assertEqual(contributor.email, 'testusr@test.com')
        self.assertEqual(contributor.url, 'test.com/testusr')

    def testGetAllCompanies(self):
        comapnies = Company.query.all()
        self.assertEqual(len(company), 1)

    def testGetSpecificCompany(self):
        company = Company.query.filter_by(id=3)
        self.assertEqual(company.name, 'TestCom')
        self.assertEqual(company.url, 'test.com/testcom')
        self.assertEqual(company.description, 'test')

    def testGetAllProjects(self):
        projects = Project.query.all()
        assertEqual(len(projects), 2)

    def testGetSpecificProject(self):
        project = Project.query.filter_by(id=4)
        self.assertEqual(project.name, 'testProj')
        self.assertEqual(project.url, 'test.com/testproj')
        self.assertEqual(project.description, 'test')

if __name__ == "__main__":
        main()
