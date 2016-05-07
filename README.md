# Hair Salon

#### By _Ming Wen_

## Description

Simple hair salon app that allows you to add and display a listing of stylists and each stylist's clients.

  In PSQL:  
  CREATE DATABASE hair_salon;  
  CREATE TABLE stylists (id serial PRIMARY KEY, first_name varchar, last_name varchar);  
  CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, birthday varchar, stylistid int);  

## Setup and Installation Requirements

  Clone the repo.  
  Restore the database file  
  &nbsp;&nbsp;1. Connect to psql and run '# CREATE DATABASE hair_salon'  
  &nbsp;&nbsp;2. Restore the included hair_salon.sql file by running 'psql hair_salon < hair_salon.sql' in bash  
  Navigate to the project directory.  
  Run a instance of the gradle web server with 'gradle run'.  
  Navigate to localhost:4567 to view the app in action.

### License

Available for use under the MIT license.
Copyright (c) 2016 **_Ming Wen_**

  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
