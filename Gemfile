source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.1'
gem 'pg'                        # PostgreSQL

gem 'sass'
gem 'sass-rails', '~> 5.0'      # SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'      # Compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0'  # CoffeeScript for .coffee assets and views
gem 'foundation-rails'          # Front-end framework

gem 'kaminari'              # Pagination
gem 'diffy'                 # Generate html diff output for two strings
gem 'sanitize'              # Sanitize rich text for selected tags and attributes
gem 'paperclip', '~> 4.2'   # File upload to S3 storage
gem 'aws-sdk', '~> 1.5.7'
gem 'prawn_rails'           # PDF generation
gem 'prawn-table'


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'        # Use jquery as the JavaScript library
# gem 'jquery-ui-rails'
gem 'nested_form'         # Easy dynamic fields (adding and removing) in nested forms
gem 'turbolinks'          # Mkes following links in your web application faster. (https://github.com/rails/turbolinks)

gem 'sdoc', '~> 0.4.0', group: :doc   # bundle exec rake doc:rails generates the API under doc/api.

gem 'paper_trail', '~> 4.0.0.beta'    # Keeps versions of chosen models


gem 'passenger'                           # App server
gem 'rails_12factor', group: :production  # Use Rails 12 factor for Heroku
gem 'rollbar', '~> 1.4.4'                 # Monitor exceptions
gem 'newrelic_rpm'                        # Application performance monitoring

gem 'platform-api'                        # Use Heroku API to show update status
gem 'dotenv-rails'                        # Load environment variables from .env into ENV in development.

# API
gem 'jbuilder', '~> 2.0'  # JSON APIs  (https://github.com/rails/jbuilder)

# Auth
gem 'devise',           '>= 2.0.0'
gem 'devise_invitable', '~> 1.3.4'


group :test do
  gem 'minitest'
  gem 'minitest-reporters'                # For RubyMine
  gem 'shoulda'
  gem 'codeclimate-test-reporter', require: nil
  gem 'factory_girl_rails'
end


group :development, :test do
  gem 'better_errors'         # Detailed exceptions pages
  gem 'binding_of_caller'
  gem 'byebug'                # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'web-console', '~> 2.0' # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'bullet'                # Find N+1 queries
  gem 'annotate', '~> 2.6.8'  # Generate a schema comment on top of models, fixtures, and tests
  gem 'rails-footnotes', '~> 4.0'     # See variables, database queries, etc. from the application

  gem 'mailcatcher'           # Use MailCatcher to test mailers in development

  gem 'spring'                # Spring speeds up development by keeping your application running in the background.
                              #   Read more: https://github.com/rails/spring
  gem 'quiet_assets'          # Use Quiet Assets to turn off the Rails Asset Pipeline log
end
