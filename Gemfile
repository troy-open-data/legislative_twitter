source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails',            '4.2.3'
gem 'pg',               '0.18.2'
gem 'passenger',        '~> 5.0'

# assets
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
gem 'simple_form',      '~> 3.1'

# functionality
gem 'paperclip',        '~> 4.3'
gem 'aws-sdk',          '~> 1.6'
gem 'prawn_rails',      '0.0.11'
gem 'prawn-table',      '0.2.2'

gem 'paper_trail',      '~> 4.0.0'
gem 'acts_as_list',     '0.7.2'

# support
gem 'platform-api' # Use Heroku API to show update status
gem 'pry-rails'

# auth
gem 'devise',             '~> 3.2'
gem 'devise_invitable',   '~> 1.5'

# API
gem 'versionist',         '~> 1.4'
gem 'jbuilder',           '~> 2.0'

group :production do
  # logging and exception reporting
  gem 'rails_12factor',   '0.0.3'
  gem 'rollbar',          '~> 2.1'
  gem 'newrelic_rpm',     '~> 3.13'
end

# Non-Production Dependencies

gem 'sdoc', '~> 0.4.0', group: :doc

group :development do
  gem 'annotate',        '~> 2.6.8', require: nil
  gem 'rails-footnotes', '~> 4.0'
  gem 'mailcatcher',     require: false

  # browser error formatting
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'dotenv-rails', '~> 2.0.1'
  gem 'quiet_assets'
  gem 'spring',       '~> 1.3.6'

  # linters/debuggers/code checkers
  gem 'rubocop',  require: false
  gem 'brakeman', require: false
  gem 'bullet'

  # test libraries
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'minitest-around'
  gem 'shoulda'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'

  # reporters
  gem 'minitest-reporters', '~> 1.0.16'
  gem 'mini_backtrace',     '~> 0.1.3'
  gem 'codeclimate-test-reporter', require: nil

  # develompent/test tasks
  gem 'guard',          '~> 2.12.5'
  gem 'guard-minitest', '~> 2.4.4'
  gem 'guard-rubocop'
  gem 'guard-brakeman'
  gem 'guard-annotate', '~> 2.2'
end
