from flask import Flask, render_template, url_for, jsonify
import json

dummyapp = Flask(__name__)

projects2 = {"1":{"id":1, "name":"example_project1", "url":"http://github.com/company1/example_project1", "languages":["Java"], "contributors":[1,2], "description":"Example_Project1 is a project ..."},
             "2":{"id":2, "name":"example_project2", "url":"http://github.com/company1/example_project2", "languages":["Python"], "contributors":[1,2], "description":"Example_Project2 is a project ..."}}

companies2    = {"1":{"id":1, "name":"Company1", "url": "http://github.com/company1", "project_ids":[1], "member_ids":[2], "description":"Company1 is a company focused on ..."},
                 "2":{"id":2, "name":"Company2", "url": "http://github.com/company2", "project_ids":[2], "member_ids":[1], "description":"Company1 is a company focused on ..."}}

contributors2 = {"1":{"id":1, "username":"usr1", "email":"user1@company2.com", "url":"http://github.com/usr1", "project_ids":[1,2],"companies":[2]},
                 "2":{"id":2, "username":"usr2", "email":"user2@company1.com", "url":"http://github.com/usr2", "project_ids":[1,2],"companies":[1]}}

languages2    = {"python" : {"name":"Python","creator":"Guido van Rossum","project_ids":[2],"description":"Python is a language ...", "paradigms":["functional", "Object Oriented"]},
                 "java" : {"name":"Java","creator":"James Gosling","project_ids":[1], "description":"Java is a language ...", "paradigms":["Object Oriented"]}}

@dummyapp.route('/')
def index():
    return render_template('index.html')

@dummyapp.route('/api/contributors/')
def contributors():
    global contributors2 
    return jsonify([contributors2[k] for k in contributors2])

@dummyapp.route('/api/contributors/<id>')
def contributor(id):
    global contributors2 
    return jsonify(contributors2[id])

@dummyapp.route('/api/projects/')
def projects():
    global projects2 
    return jsonify([projects2[k] for k in projects2])

@dummyapp.route('/api/projects/<id>')
def probejct(id):
    global projects2 
    return jsonify(projects2[id])

@dummyapp.route('/api/languages/')
def languages():
    global languages2 
    return jsonify([languages2[k] for k in languages2])

@dummyapp.route('/api/languages/<name>')
def language(name):
    global languages2 
    return jsonify(languages2[name.lower()])

@dummyapp.route('/api/companies/')
def companies():
    global companies2
    return jsonify([companies2[k] for k in companies2])

@dummyapp.route('/api/companies/<id>')
def company(id):
    global companies2 
    return jsonify(companies2[id])

if __name__ == "__main__":
    dummyapp.run()
