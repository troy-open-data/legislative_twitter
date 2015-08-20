source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails',            '4.2.3'
gem 'pg',               '0.18.2'

# Assets
gem 'sass',             '~> 3.4'
gem 'sass-rails',       '~> 5.0'
gem 'foundation-rails', '~> 5.5'

gem 'uglifier',         '>= 1.3.0'
gem 'coffee-rails',     '~> 4.1'
gem 'jquery-rails',     '~> 4.0'
gem 'turbolinks'
gem 'nested_form',      '0.3.2'
gem 'kaminari',         '0.16.3'
gem 'diffy',            '~> 3.0'

# Functionality
gem 'paperclip',        '~> 4.3'
gem 'aws-sdk',          '~> 1.5.7'
gem 'prawn_rails',      '0.0.11'
gem 'prawn-table',      '0.2.2'

gem 'paper_trail',      '~> 4.0.0'
gem 'acts_as_list',     '0.7.2'

# Support
gem 'platform-api' # Use Heroku API to show update status
gem 'pry-rails'

# Auth
gem 'devise',             '~> 3.2'
gem 'devise_invitable',   '~> 1.5'

# API
gem 'versionist',         '~> 1.4'
gem 'jbuilder',           '~> 2.0'

group :production do
  gem 'passenger',        '~> 5.0'
  gem 'rails_12factor',   '0.0.3'
  gem 'rollbar',          '~> 2.1'
  gem 'newrelic_rpm',     '~> 3.13'
end

gem 'sdoc', '~> 0.4.0',   group: :doc

group :test do
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'shoulda'
  gem 'capybara'
  gem 'codeclimate-test-reporter',    require: nil
  gem 'factory_girl_rails'
end

group :development do
  gem 'rubocop'
  gem 'mailcatcher'
  gem 'bullet'
  gem 'better_errors'
  gem 'annotate',         '~> 2.6.8', require: nil
  gem 'rails-footnotes',  '~> 4.0'
end

group :development, :test do
  gem 'dotenv-rails',     '~> 2.0'
  gem 'binding_of_caller'
  gem 'spring',           '~> 1.3.6'
  gem 'quiet_assets'
end
