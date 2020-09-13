# SchoolERP

## ***Some of the screenshots of the many tabs in the ERP*** 
## Dashboard Page
<img src="./readme-images/dashboard-home.png" width="800">
&nbsp;

## Update ERP Profile 
<img src="./readme-images/update-profile.png" width="800">
&nbsp;

## Add Employees/ Student Details 
<img src="./readme-images/add-details.png" width="800">
&nbsp;

## Classwise Marks Comparison
<img src="./readme-images/classwise-marks.png" width="800">
&nbsp;

## Attendance Graph
<img src="./readme-images/attendence-student.png" width="800">
&nbsp;

## Mark Attendance
<img src="./readme-images/mark-attendence.png" width="800">
&nbsp;

## Chcek Employees/Student Details
<img src="./readme-images/employees-list.png" width="800">
&nbsp;

## Write Notice to Students
<img src="./readme-images/write-notice.png" width="800">


&nbsp;
&nbsp;


## Steps to setup project on your local machine


### Clone the project to your PC

```
git clone git@github.com:yashboura303/School_ERP.git
```

### Change into project directory
```
cd 'project name'
```

### Install requirements
```
pip install requirements.txt
```

### Create database

For postgresql change engine in settings.py/DATABASES

    'django.db.backends.postgresql_psycopg2'

 `Change the user and password according to your database servers`

 `Create new database and set 'NAME' : <database_name>`

### Makemigrations and migrate

```
python manage.py makemigrations

python manage.py migrate
```

### Start the development server

```
python manage.py runserver
```