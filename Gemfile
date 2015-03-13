source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use PostgreSQL as the database for Active Record
gem 'pg'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use Foundation to make the site pretty
gem 'foundation-rails'


# Use Kaminari in order to paginate listed results
gem 'kaminari'
# Use HTMLDiff to generate html diff output for two strings
gem 'diffy'
# Use Sanitize to sanitize rich text for selected tags and attributes
gem 'sanitize'
# Use paperclip and aws-skd for file upload to S3 storage
gem 'paperclip', '~> 4.2'
gem 'aws-sdk', '~> 1.5.7'
# PDF generation with prawn
gem 'prawn_rails'
# Easy dynamic fields (adding and removing) in nested forms
gem 'nested_form'


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Paper Trail keeps versions of chosen models
gem 'paper_trail', '~> 4.0.0.beta'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rails 12 factor for Heroku
gem 'rails_12factor', group: :production
# Use Rollbar to monitor exceptions
gem 'rollbar', '~> 1.4.4'
# Use NewRelic for application performance monitoring
gem 'newrelic_rpm'


# Include Minitest and Minitest Reporters for RubyMine
group :test do
  gem 'minitest'
  gem 'minitest-reporters'
  gem 'codeclimate-test-reporter', require: nil
end


group :development, :test do
  # Use BetterErrors for more detailed exceptions pages
  gem 'better_errors'
  gem 'binding_of_caller'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Use Bullet to increase application performance by reducing the number of queries it makes
  gem 'bullet'
  # Use MailCatcher to test mailers
  gem 'mailcatcher'
  # Use Reek to find inconsistancies and ugly programming
  # gem 'reek'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Use Quiet Assets to turn off the Rails Asset Pipeline log
  gem 'quiet_assets'

  # Shim to load environment variables from .env into ENV in development.
  gem 'dotenv-rails'
  # Use Travis Lint to check .travis.yml syntax
  gem 'travis-lint'

  # Use Annotate to generate a schema on top of models, fixtures, and tests
  gem 'annotate', '~> 2.6.6'
  # Use Rails Footnotes to see variables, database queries, etc. from the application
  gem 'rails-footnotes', '~> 4.0'
end
