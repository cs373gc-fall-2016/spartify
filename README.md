Setup:
PostgreSQL needs to be installed. This is platform dependendent so you'll just have to
google setup instructions on your resprecive platform.

The following instructions will setup PostgresSQl for Ubuntu:
```
$ sudo apt-get update
$ sudo apt-get install postgresql postgresql-contrib
```

Create a super user(I recommend an empty password, its not secure but should be fine for a dev environment):
```
$ sudo -u postgres createuser --superuser $USER
$ sudo -u postgres psql
postgres=# \password $USER
```

Create database named 'opensourcery' on linux this can be done as follows:
```
$ sudo -u postgres createdb opensourcery
```

next, execute the following (the dump file is in the repo):
```
$ psql opensourcery < dump.sql
```

That will import the data to the database and the database is now setup.

On ubuntu you need to install the following:
```
$ sudo apt-get update
$ sudo apt-get install python-psycopg2
```

Then use pip to install psycog libary:
```
pip install psycopg2
```

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
