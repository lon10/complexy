require_relative 'app/environment'

Dir[File.join(File.dirname(__FILE__), 'rake', '**', '*.rb')].each {|file| require file }
