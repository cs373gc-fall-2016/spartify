
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return "Hello World"

@app.route('/contributors/')
def contributors():
    return "contributor list"

@app.route('/contributors/<username>')
def contributor(username):
    return username + " was found"

@app.route('/projects/')
def projects():
    return "projects"

@app.route('/projects/<name>')
def probejct(name):
    return name + " was found"

@app.route('/languages/')
def languages():
    return "languages"

@app.route('/languages/<name>')
def language(name):
    return name + " was found"

@app.route('/companies/')
def companies():
    return "companies"

@app.route('/companies/<name>')
def company(name):
    return name + " was found"

if __name__ == "__main__":
    app.run()
