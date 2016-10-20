import unittest
from models import Contributor, Paradigm, Company, Project, Language

class TestModels(unittest.TestCase):
    def setUp(self):
        paradigm = Paradigm(name='Functional')
        language = Language(name='tstLang', creator='bob', type='Interpreted', firstAppeared=1987, description='test')
        company = Company(name='TestCom', email='test@test.com',
                          url="test.com/testcom", avatar_url='test.com/testcom/avatar', description='test')
        contributor = Contributor(username='testusr', email='testusr@test.com',
                                  url='test.com/testusr', avatar_url='test.com/testusr/avatar', location='Texas')
        project = Project(name='testProj', url='test.com/testproj', description='test', createdDate='June, 11', private=False)
        language.id = 1
        contributor.id = 2
        company.id = 3
        project.id = 4
        language.paradigms.append(paradigm)
        project.languages.append(language)
        project.company = company
        project.owner_id = company.id
        project.contributors.append(contributor)
        company.members.append(contributor)
        self.paradigm = paradigm
        self.language = language
        self.contributor = contributor
        self.company = company
        self.project = project

    def testLanguageDict(self):
        ldict = {'name':'tstLang', 'creator':'bob', 'type':'Interpreted', 'firstAppeared':1987, 'description':'test',
                 'project_ids':[4], 'paradigms':['Functional']}
        self.assertEqual(self.language.dictionary(), ldict)

    def testContributorDict(self):
        cdict = {'id':2, 'username':'testusr', 'email':'testusr@test.com', 'url':'test.com/testusr',
                 'avatar_url':'test.com/testusr/avatar', 'location':'Texas', 'project_ids':[4],'company_ids':[3]}
        self.assertEqual(self.contributor.dictionary(), cdict)

    def testCompanyDict(self):
        cdict = {'id':3, 'name':'TestCom', 'email':'test@test.com', 'url':"test.com/testcom",
                 'avatar_url':'test.com/testcom/avatar', 'description':'test', 'project_ids':[4], 'member_ids':[2]}
        self.assertEqual(self.company.dictionary(), cdict)

    def testProjectDict(self):
        pdict = {'id':4, 'name':'testProj', 'url':'test.com/testproj', 'description':'test', 'createdDate':'June, 11',
                 'private':False, 'languages':['tstLang'], 'contributor_ids':[2], 'owner_id':3}
        self.assertEqual(self.project.dictionary(), pdict)

if __name__ == "__main__":
        unittest.main()
