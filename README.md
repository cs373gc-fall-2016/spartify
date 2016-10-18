Setup:
PostgreSQL needs to be installed. This is platform dependendent so you'll just have to
google setup instructions on your resprecive platform.

Create database named 'opensourcery' on linux this can be done as follows:
$ sudo -u postgres createdb opensourcery

next, execute the following:
$ cd db-dump
$ psql openssourcery < dump.sql

That will import the data to the database
This finishes the setup.
 
To Run:
$ python app.py runserver

This will launch the server on localhost:5000. You can visit this address in your browser to interact with the app.
