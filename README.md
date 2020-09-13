# SchoolERP


## Clone the project to your system
```console
git clone -b v0.1 git@gitlab.com:nikhil.khandelwal/schoolerp.git
```
## Change into project directory

```console
cd schoolerp
```

## Install System Requirements

Run the shell script to install all the system requirements

```console
sh startup.sh
``` 

## Create virtual environment

```python
python3 -m venv schoolerp-venv
source schoolerp-venv/bin/activate
```

## Install requirements

```python
pip3 install -r requirements.txt
```

## Create database 

<!-- For mysql change engine in settings.py/DATABASES

	'django.db.backends.mysql'

For postgresql change engine in settings.py/DATABASES

	'django.db.backends.postgresql_psycopg2'

Change the user and password according to your database servers

	Create new database and set 'NAME' : <database_name> -->
```console
sudo -u postgres psql -f ./setup.sql
```

## Makemigrations and migrate
	
```python
python3 manage.py makemigrations
python3 manage.py migrate
```

## Start the development server
```python
python3 manage.py runserver
```
