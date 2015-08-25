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
# require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! [
  Minitest::Reporters::SpecReporter.new
]

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'minitest/around/unit'
require 'paperclip/matchers'
require 'matchers/controller/allow_requests_from_origin_matcher'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# rubocop:disable Style/ClassAndModuleChildren
class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  extend Paperclip::Shoulda::Matchers

  # def around(&tests)
  #   DatabaseCleaner.cleaning(&tests)
  # end

  def json(body)
    JSON.parse(body, symbolize_names: true)
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
  setup { @admin = create(:user) }
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
# rubocop:enable Style/ClassAndModuleChildren
