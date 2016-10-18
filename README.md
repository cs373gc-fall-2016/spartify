Setup:
PostgreSQL needs to be installed. This is platform dependendent so you'll just have to
google setup instructions on your resprecive platform.

Create database named 'opensourcery' on linux this can be done as follows:
```
$ sudo -u postgres createdb opensourcery
```

next, execute the following:
```
$ psql openssourcery < dump.sql
```

That will import the data to the database

Also load the requirements file.
```
$ pip install -r requirements.txt
```

This finishes the setup.
 
To Run:
```
$ python app.py runserver
```

This will launch the server on localhost:5000. You can visit this address in your browser to interact with the app.
