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
  include FactoryGirl::Syntax::Methods

  def json(body)
    JSON.parse(body, symbolize_names: true)
  end

  # Relationships
  def should_belong_to(child_class, parent)
    relationship = child_class.reflect_on_association(parent)
    relationship.macro == :belongs_to
  end

  def should_have_many(parent_class, children)
    relationship = parent_class.reflect_on_association(children)
    assert_equal relationship.macro, :has_many
  end

  def should_have_many_through(parent_class, children, through)
    relationship = parent_class.reflect_on_association(children)
    assert_equal relationship.macro, :has_many
    assert_equal relationship.options[:through], through
  end

  # Validations
  def should_validate_presence_of(attribute, klass)
    klass = build(klass, attribute => nil)
    !klass.save
  end
end

class ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @admin = create(:admin)
  end
end
