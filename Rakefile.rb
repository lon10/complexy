require_relative 'lib/environment'

Dir[File.join(File.dirname(__FILE__), 'rake', '**', '*.rb')].each {|file| require file }
