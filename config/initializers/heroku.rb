require 'platform-api'

# Set up integration wtih Heroku API
unless (app_name = ENV['HEROKU_APP_NAME']).nil?
  require 'platform-api'

  heroku = PlatformAPI.connect(ENV['HEROKU_API_KEY'])
  release = heroku.app.info(app_name)

  ENV['HEROKU_RELEASED_AT'] = release['released_at']
end