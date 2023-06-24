# README

Movie catalog service API using two endpoints, one that reads a CSV file and creates records in the database. And a second that lists all the movies registered in JSON format.

* Ruby Version: 3.2.1
* Rails Version: 7.0.5
* Postgres Database

<hr>

**CONFIGURATION**

Copy the *.env_sample* file to the project's root folder and create a file named **.env** in the same location. In the created file add your postgres credentials. If you don't have a user you will need to create one before trying to run this.

<hr>

**ENDPOINTS**

> /api/v1/movies/import_catalog

> /api/v1/movies/list_catalog

For filters in the listing endpoint, the following parameters can be used in the request -> *title, genre, country, published_at, year, description*.

***examples:***

> /api/v1/movies/list_catalog?genre=TV Show

> /api/v1/movies/list_catalog?year=2020&country=Estados Unidos

<hr>

**TESTS**

To run tests, run the command below in the console

<code>$ rspec spec</code>
