# README

This project contains a very simple (one model) application Rails 7 application using Docker, Postgres, Puma and Redis. 

I had some trouble confirguring everything up so that it worked. Hope this helps someone else. The configuration was mostly 
taken from
* https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application (but with Puma instead of Unicorn)
* https://itnext.io/docker-rails-puma-nginx-postgres-999cd8866b18 ( without nginx)

Prerequites:
* Install Docker and Docker Desktop
* Clone this repo

Next steps:
* Create a .env file, and copy env-example to it. Modify the secret. 
* Start the application in Docker Desktop
* Create the database. In a console at the root of your app: `docker-compose run web rake db:create`
* Migrate the database: `docker-compose run web rake db:migrate`

See if it works:
* Go to http://0.0.0.0:3000/manufacturers (if you have not changed the model)
* See the database here: http://localhost:8080/?pgsql=127.0.0.1&username=postgres&db=store7_development

Test:
* Prepare the test db. Run: `docker compose run web rake db:test:prepare`
* And then run the actual tests: `docker-compose run web rake test`



