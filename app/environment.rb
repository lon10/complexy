$stdout.sync = true

$ENV = ENV['RACK_ENV'] || 'development'

$ROOT_DIR = File.expand_path('../../', __FILE__)

unless %w(production development test).include?($ENV)
  raise "Invalid environment: #{$ENV}, please check RACK_ENV environment variables"
end

require 'bundler'
Bundler.require

require 'active_support'
require 'active_support/dependencies'

require_relative "environments/#{$ENV}"


ActiveSupport::Dependencies.autoload_paths << File.expand_path('../', __FILE__)

OTR::ActiveRecord.configure_from_file!('config/database.yml')

Mongoid.load!('config/mongoid.yml', $ENV)
