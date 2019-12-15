#SchoolERP


##System Requirement

	sudo apt-get update

	sudo apt-get install python3

	sudo apt install python3-pip

	sudo apt install -y python3-venv

	sudo apt install git

## Clone the project to your PC

	git clone -b v0.1 git@gitlab.com:nikhil.khandelwal/schoolerp.git

## Change into project directory

	cd <project_name>

## Create virtual environment

	mkvirtualenv <project_name>

	source <project_name>/bin/activate

## Install requirements

	pip install -r requirements.txt

## Create database 

	For mysql change engine in settings.py/DATABASES

	'django.db.backends.mysql'

	For postgresql change engine in settings.py/DATABASES

	'django.db.backends.postgresql_psycopg2'

	Change the user and password according to your database servers

	Create new database and set 'NAME' : <database_name>


## Makemigrations and migrate
	python manage.py makemigrations

	python manage.py migrate

## Start the development server

	python manage.py runserver

