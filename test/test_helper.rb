# Code Climate Test Reporter and SimpleCov (detects test coverage)
require 'codeclimate-test-reporter'
SimpleCov.start('rails') do
  formatter SimpleCov::Formatter::MultiFormatter[
      SimpleCov::Formatter::HTMLFormatter,
      CodeClimate::TestReporter::Formatter
  ]
  minimum_coverage 90
end

# Minitest and Reporters
require 'minitest/autorun'
require 'minitest/reporters'
require 'paperclip/matchers'
require 'matchers/controller_matchers'
Minitest::Reporters.use! Minitest::Reporters::RubyMineReporter.new

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  extend Paperclip::Shoulda::Matchers

  def json(body)
    JSON.parse(body, symbolize_names: true)
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
  include Matchers::Controller
  setup { @admin = create(:admin) }
end
