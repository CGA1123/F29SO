# REAF - Resource Management System (RMS)

![REAF LOGO](/resources/reaf_logo.png)

## Project Status (Develop Branch)
[![Build Status](https://travis-ci.com/CGA1123/F29SO.svg?token=CLPqdNeNYg5kLHcGitp5&branch=develop)](https://travis-ci.com/CGA1123/F29SO)
[![Code Climate](https://codeclimate.com/repos/57f27aea12e7170061001cb3/badges/0aa6f804f2c187f0aed7/gpa.svg)](https://codeclimate.com/repos/57f27aea12e7170061001cb3/feed)
[![Test Coverage](https://codeclimate.com/repos/57f27aea12e7170061001cb3/badges/0aa6f804f2c187f0aed7/coverage.svg)](https://codeclimate.com/repos/57f27aea12e7170061001cb3/coverage)

## Heroku Sites

Current live versions of the project can be accessed:

[Develop](https://reaf-rms-develop.herokuapp.com/) Branch

[Master](https://reaf-rms-master.herokuapp.com/) Branch

## Installation

### Dependencies

- Ruby `2.3.2`
- Bundler
- Postgresql

See [Getting Started](GETTING_STARTED.md) for some more detailed instruction.

See [Contibution Guidelines](CONTRIBUTING.md) before making changes to the projects codebase.

#### Quick Start

- Clone the repo onto your local machine  `git clone https://github.com/CGA1123/F29SO`
- Get into the project directory          `cd F29SO`
- Install the gems used by the project    `bundle install`
- Set up your databases                   `rake db:setup`
- Run the test suite                      `rake`
- Start up the rails server               `rails s`
