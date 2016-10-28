#Setup: 
In addtion to the database setup described below do the following to get Angular2 to work.

Install node and npm
`
$ sudo apt-get install npm
$ sudo apt-get install nodejs-legacy
$ sudo apt-get install tsc
`

Install the apps dependencies (this is done in the project root directory)
`
$ npm install
`

Compile the TypeScript (this is done in the project root directory)
`
$ tsc -w

The you should be able to go to the backend and start the server
`
$ cd ./backend
$ python backend.py runserver
`

You should be able to navigate to localhost:5000 and see the angular frontend load. 

#DB Setup (Should only need to be done once)
PostgreSQL needs to be installed.  Apparantly you can use http://postgresapp.com/ if your using mac OS X.
Installation instructions for Ubuntu ared below and I would expect that the experience would be fairly similar for other linux
distributions. If your using windows well then your on your on figuring out how to install it.

The following instructions will setup PostgresSQl for Ubuntu:
```
$ sudo apt-get update
$ sudo apt-get install postgresql postgresql-contrib
```
Change every instance of 'md5' to 'trust in the following config file:
```
$ sudo vim /etc/postgresql/9.5/main/pg_hba.conf
```
Then restart the psql server:
```
$sudo /etc/init.d/postgresql restart
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
$sudo pip install flask
$sudo pip install flask_sqlalchemy
$sudo pip install flask_script
```

This finishes the setup.
 
To Run:
```
$ python backend.py runserver
```

This will launch the server on localhost:5000. You can visit this address in your browser to interact with the app.
