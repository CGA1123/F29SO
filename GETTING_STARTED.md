# Getting Started Guide

This document outlines some ways for installing this projects dependencies.

Once all dependencies are installed see the [Contribution Guidelines](CONTRIBUTING.md) before starting work on the project.

## Installing Dependencies

### Ruby

#### MacOS / Linux

A ruby version manager like [`rvm`](https://rvm.io/) is recommended. [Installation Instructions](https://rvm.io/rvm/install)

Once `rvm` is installed, install the ruby version needed for this project. `rvm install 2.4`

Restart your shell, and check that the correct ruby version is being used by your system by running `ruby --version`, you should get output similar to `ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin15]`.

#### Windows

Windows can also run `rvm`, and the `rvm` website references [this tutorial](http://blog.developwithpassion.com/2012/03/30/installing-rvm-with-cygwin-on-windows/).


*More options available on the [ruby website](https://www.ruby-lang.org/en/documentation/installation/)*

### Bundler

Once `ruby` is intalled, you will need [`bundler`](http://bundler.io/).

Running `gem install bundler` should take care of that.

### Postgresql

Official [Installation Instructions](https://wiki.postgresql.org/wiki/Detailed_installation_guides)

For MacOS, I found the [App](http://postgresapp.com/) to be the easiest to install.

### Redis

[Official Website](https://redis.io/)

For MacOS, with homebrew, `brew install redis`

For Debian/Ubuntu:
```
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
```

(Taken from [here](https://redis.io/topics/quickstart))

### Foreman

Foreman helps to manage running multiple services for our server, through a `Procfile`. (Currently we start the `sidekiq` process, and the `rails server` process)

The GitHub for `foreman` can be found [here](https://github.com/ddollar/foreman).

`gem install foreman`

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

Then finally run foreman (which will start sidekiq, the rails server, & the redis-server)

`foreman start -f Procfile.dev`

And go to [`http://localhost:5000`](http://localhost:5000).
