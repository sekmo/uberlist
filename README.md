# Welcome to Uberlist!

UberList is a Rails application that lets you crete projects and organize your tasks!

Demo at [https://uberlist.sekmo.cc](https://uberlist.sekmo.cc)

Current data models:

* User - Authentication is managed by Devise
* Project - You do like making projects, right?
* Task - it's shallow-nested under projects

## Todo

* Refactor endpoints to have `/projects/42/tasks` and `/tasks` as well, for loose tasks (in-tray tasks)
* Use `acts_as_list` and jQuery UI `sortable` for tasks and projects


## Installation

Run:
```shell
bundle
bin/rails db:create db:migrate
bin/rails s
```

App is running at [localhost:3000](http://localhost:3000/).

## Test

Run:
```shell
bin/rails db:create db:migrate RAILS_ENV=test
bundle exec rspec
```

## Code Status

[![Build Status](https://travis-ci.org/sekmo/uberlist.svg?branch=master)](https://travis-ci.org/sekmo/uberlist)

## License

UberList is released under the [MIT License](https://opensource.org/licenses/MIT).
