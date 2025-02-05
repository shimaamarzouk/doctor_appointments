# DoctorAppointments

DoctorAppointments is a web application for managing doctor appointments. It is built using the Hanami framework. Find full document [here](https://docs.google.com/document/d/1-YreaWcjjJnsYOOVt9RBGWZTrW_ZigYrn3xGNJertUQ/edit?tab=t.0#heading=h.z7vhitygxki4)

## Getting Started

### Prerequisites

- Ruby (version 3.1 or higher)
- PostgreSQL
- Node.js (for asset management)

### Pre-Installations

- Install homebrew

- Install rvm, or chruby

- Install npm

- Install hanami

- Install git

#### - Install postgres
	- brew install postgresql
	- brew services start postgresql@<your_version>
	- postgres -V (to make sure it’s installed)
	- run psql postgres
		> CREATE EXTENSION "uuid-ossp";

### Getting up and running
    #### Clone the repository:
```
   git clone git@github.com:shimaamarzouk/doctor_appointments.git
   cd doctor_appointments
```
    #### prepare environment:
```
    bundle install
```
    #### create .env.development with the following:
		```
        DATABASE_URL="postgresql://<username>:<password>@localhost/doctor_appointments_development"
        ```
    #### create .env.test file with the following:
		```
        DATABASE_URL="postgresql://<username>:<password>@localhost/doctor_appointments_test”
        ```
    #### prepare database
```
   createdb -O <username> doctor_appointments_development
   createdb -O <username> doctor_appointments_test
   hanami db prepare
   hanami db migrate
```
    #### run server
    ```
        bundle exec hanami dev
    ```
