require 'platform-api'

# Set up integration wtih Heroku API
unless (app_name = ENV['HEROKU_APP_NAME']).nil?
  require 'platform-api'

  heroku = PlatformAPI.connect(ENV['HEROKU_API_KEY'])

  # Fetch lsit of builds
  build_list = heroku.build.list(app_name)

  # Determine buld count and most recent build
  build_count = build_list.count
  last_build = build_list.last

  ENV['HEROKU_BUILD_COUNT'] = build_count.to_s
  ENV['HEROKU_BUILD_STATUS'] = last_build['status'].to_s
  ENV['HEROKU_RELEASED_AT'] = last_build['updated_at'].to_s
end