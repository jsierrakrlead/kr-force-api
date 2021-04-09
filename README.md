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
