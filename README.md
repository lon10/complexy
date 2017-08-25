## Installation

1. Install Ruby 2.2.x
2. `$ bundle install`
3. `$ cp ./config/database_sample.yml ./config/database.yml`
4. `$ psql -c "create database tax_reporter_dev;"`
5. `$ bundle exec rake db:migrate`

## Running

1. `bundle exec rackup -p 4567`

## Testing

1. `bundle exec rspec`