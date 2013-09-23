require "rubygems"
require "bundler/setup"

use Rack::SSL if ENV['RAILS_ENV'] == "production"

require File.expand_path(File.join(File.dirname(__FILE__), 'app'))

run Example.app