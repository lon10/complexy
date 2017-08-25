## Installation

1. Install Ruby 2.2.x
2. `$ bundle install`
3. `$ cp ./config/database.sample.yml ./config/database.yml`
4. `$ cp ./config/mongoid.sample.yml ./config/mongoid.yml`
5. `$ psql -c "create database multiple_complexy_dev;"`
6. `$ bundle exec rake db:migrate`
7. `$ bundle exec rake db:seed`

## Running

1. `bundle exec rackup -p 4567`

## Testing

1. `$ psql -c "create database multiple_complexy_test;"`
2. `bundle exec rspec`
