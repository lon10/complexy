ENV['RACK_ENV'] ||= 'test'

require 'rspec'
require 'rspec/its'
require 'rack/test'
require 'pry'
require 'factory_girl'
require 'database_cleaner'

require_relative '../lib/environment'

require 'support/factories'

DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.find_definitions
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  def app
    Complexy::API
  end
end
