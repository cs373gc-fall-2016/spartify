""" 
This Module contains configuration for the Database.
Its separated out this way to facilitate testing
"""
from flask import Flask, render_template, url_for, jsonify, abort
from flask_sqlalchemy import SQLAlchemy
from flask_script import Manager, Shell

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://localhost/opensourcery'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
manager = Manager(app)

