source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails',            '4.2.1'
gem 'pg',               '0.18.2'

# Assets
gem 'sass'
gem 'sass-rails',       '~> 5.0'
gem 'foundation-rails'

gem 'uglifier',         '>= 1.3.0'
gem 'coffee-rails',     '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'nested_form'
gem 'kaminari'
gem 'diffy'

# Functionality
gem 'paperclip',        '~> 4.2'
gem 'aws-sdk',          '~> 1.5.7'
gem 'prawn_rails'
gem 'prawn-table'

gem 'sdoc',             '~> 0.4.0',   group: :doc

gem 'paper_trail',      '~> 4.0.0.beta'
gem 'acts_as_list'

# Support
gem 'platform-api' # Use Heroku API to show update status
gem 'pry-rails'

# Auth
gem 'devise',             '>= 2.0.0'
gem 'devise_invitable',   '~> 1.3.4'

# API
gem 'versionist'
gem 'jbuilder',           '~> 2.0'

group :production do
  gem 'passenger'
  gem 'rails_12factor'
  gem 'rollbar',          '~> 1.4.4'
  gem 'newrelic_rpm'
end

group :test do
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'shoulda'
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
  gem 'dotenv-rails'
  gem 'binding_of_caller'
  gem 'spring',           '~> 1.3.6'
  gem 'quiet_assets'
end
