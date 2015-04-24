# Code Climate Test Reporter and SimpleCov (detects test coverage)
require 'codeclimate-test-reporter'
SimpleCov.start('rails') do
  formatter SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::HTMLFormatter,
      CodeClimate::TestReporter::Formatter
  ]
  minimum_coverage 95
end


# Minitest and Reporters
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::RubyMineReporter.new



ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'



class ActiveSupport::TestCase
  # Allow Factory Girl methods to not be prefixed with the class FactoryGirl
  include FactoryGirl::Syntax::Methods

  def json(body)
    JSON.parse(body, symbolize_names: true)
  end
end
