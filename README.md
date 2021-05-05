# README

To install rails via rvm, go to https://rvm.io/rvm/install and view the basic install.

To run the application once rails is installed:

```
$ bundle install
$ rails db:create
$ rails db:setup
$ rails s

```

The environment files take secrets or rails credentials file. For more information on rails credentials see:

https://edgeguides.rubyonrails.org/security.html

To be able to run the console, you will delete config/credentials.yml.enc file

Then run

```
$ EDITOR=vim rails credentials:edit

```

In the root rails folder, this command will create a new master.key and credentials.yml.enc file.

The yml file editable via vim will then take the following structure:

```
  secret_key_base: yourAutomaticallyGeneratedKeyBase

  your_environment:
    db:
      username: your_db_username
      password: your_db_password

```

This will allow you to view the database from the terminal by running:

```
bin/rails c -e your_environment

```

To set up the database you will need to seed it from the command line after the db has been created:

```
$ RAILS_ENV=your_env bin/rails db:setup

```

This should seed your database.

# Provisioning:

You may provision the server for ruby/rails using RVM: https://rvm.io/rvm/install

For postresql documentation you can see a helpful tutorial here:
https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart to install postgresql locally. However, this application should connect to an RDS instance, so you will need to configure the credentials.yml file with the right secrets for rails to connect.

# Deploying

There are many ways to deploy rails, but here are a few tutorials including one using a tool capistrano if you want to use declarative ruby code in your recipes.

AWS Beanstalk: https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/ruby-rails-tutorial.html

Ansible and Capistrano: https://semaphoreci.com/community/tutorials/how-to-deploy-rails-applications-with-ansible-capistrano-and-semaphore

Capistrano directly to EC2: https://medium.com/@KerrySheldon/ec2-exercise-1-6-deploy-a-rails-app-to-an-ec2-instance-using-capistrano-3485238e4a4a

The tools require to script and get rails running are up to you but the basic principle is to mimic what you did locally to get the application running in a remote CI/CD pipeline.

Deploying requires both the pushing of code and the starting of the application server with the database.

Example scripts to stop and start the application server in production can be found in the ./scripts folder. You may wish to edit them. The basic concept is to cd/ into the main folder of the application and open up the puma socket connection using a program called bundle (which handles ruby libraries).

The database should be handled remotely via RDS; if you configured the credentials.yml file correctly with your rds instance in a production environment, this should happen automatically on start of the server.

To seed the server database once the connection has been establish, you will do the same command you did locally:

```
$ RAILS_ENV=your_env bin/rails db:setup

```

You do not have to seed the database, but the application should clearly be able to talk to the database if necessary.
