#Setup: 
In addtion to the database setup described below do the following to get Angular2 to work.

Install node and npm
```
$ sudo apt-get install npm
$ sudo apt-get install nodejs-legacy
$ sudo apt-get install tsc
```

Install the apps dependencies (this is done in the project root directory)
```
$ npm install
```

Compile the TypeScript (this is done in the project root directory)
```
$ tsc -w
```

You can run the fronted by itself:
```
$ npm start
```

Or, you run the frontend through the backend
```
$ cd ./backend
$ python backend.py runserver
```
If you are just doing frontend work it is reccomended to just run the frontend by itself, unless you need access to all the data the backend provides
(Running the frontend by itself provides limited placeholder data just so the pages have some content in them)

#DB Setup (Should only need to be done once)
PostgreSQL needs to be installed.  Apparantly you can use http://postgresapp.com/ if you're using Mac OS X.
Installation instructions for Ubuntu are below and I would expect that the experience would be fairly similar for other linux
distributions. If you're using Windows, well, then you're on you're on figuring out how to install it.

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
$ sudo /etc/init.d/postgresql restart
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

On Ubuntu you need to install the following:
```
$ sudo apt-get update
$ sudo apt-get install python-psycopg2
```

Then use pip to install psycog libary:
```
$ pip install psycopg2
```

Also load the requirements file.
```
$ sudo pip install flask
$ sudo pip install flask_sqlalchemy
$ sudo pip install flask_script
```

This finishes the setup. You're about ready to run the server now!

You may need to switch to a postgres user profile before being able to run your app properly.
```
$ sudo su - postgres
```

To Run:
```
$ python backend.py runserver
```

This will launch the server on localhost:5000. You can visit this address in your browser to interact with the app.
