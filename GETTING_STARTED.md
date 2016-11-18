# Getting Started Guide

This document outlines some ways for installing this projects dependencies.

Once all dependencies are installed see the [Contribution Guidelines](CONTRIBUTING.md) before starting work on the project.

## Installing Dependencies

### Ruby

#### MacOS / Linux

A ruby version manager like [`rvm`](https://rvm.io/) is recommended. [Installation Instructions](https://rvm.io/rvm/install)

Once `rvm` is installed, install the ruby version needed for this project. `rvm install 2.3.2`

Restart your shell, and check that the correct ruby version is being used by your system by running `ruby --version`, you should get output similar to `ruby 2.3.2p217 (2016-11-15 revision 56796) [x86_64-darwin15]`.

#### Windows

Windows can also run `rvm`, and the `rvm` website references [this tutorial](http://blog.developwithpassion.com/2012/03/30/installing-rvm-with-cygwin-on-windows/).


*More options available on the [ruby website](https://www.ruby-lang.org/en/documentation/installation/)*

### Bundler

Once `ruby` is intalled, you will need [`bundler`](http://bundler.io/).

Running `gem install bundler` should take care of that.

### Postgresql

Official [Installation Instructions](https://wiki.postgresql.org/wiki/Detailed_installation_guides)

For MacOS, I found the [App](http://postgresapp.com/) to be the easiest to install.

## Getting the project running

Once all the dependencies are installed, you can start getting the project running.

First of all clone the git repository onto your local computer.

`git clone https://github.com/CGA1123/F29SO.git`

Then, navigate to the folder where the project was cloned.

`cd F29SO`

Install all the ruby gem dependencies:

`bin/setup`

Check that everything is working:

`bin/test`

*You may need to install the postgresql adapter gem seperately `gem install pg -- --with-pg-config=(path/to/config)`, on MacOS with postgresql app path should be `/Applications/Postgres.app/Contents/Versions/latest/bin/pg_config`*

And then, start up the rails server!

`bundle exec rails server`

And go to [`http://localhost:3000`](http://localhost:3000).
