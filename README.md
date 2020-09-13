# SchoolERP

## Clone the project to your PC

git clone git@github.com:yashboura303/School_ERP.git

## Change into project directory

cd <project_name>

## Create virtual environment

mkvirtualenv <project_name>

source <project_name>/bin/activate

## Install requirements

pip install -r requirements.txt

## Create database 

For postgresql change engine in settings.py/DATABASES

'django.db.backends.postgresql_psycopg2'

Change the user and password according to your database servers

Create new database and set 'NAME' : <database_name>


## Makemigrations and migrate
python manage.py makemigrations

python manage.py migrate

## Start the development server

python manage.py runserver

