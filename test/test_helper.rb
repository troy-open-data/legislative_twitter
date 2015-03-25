# Code Climate Test Reporter (detects test coverage)
require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

# Minitest and Reporters
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::RubyMineReporter.new

# Factory Girl
# require 'factory_girl'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all
  # Allow Factory Girl methods to not be prefixed with the class FactoryGirl
  include FactoryGirl::Syntax::Methods

  # Add more helper methods to be used by all tests here...
end
