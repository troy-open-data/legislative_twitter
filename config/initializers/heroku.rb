# Set up integration wtih Heroku API
if ['development','production'].include? Rails.env
  if (app = ENV['HEROKU_APP_NAME'])
    require 'platform-api'

    client = PlatformAPI.connect(ENV['HEROKU_API_KEY'])
    begin
      # Fetch list of builds
      builds = client.build.list(app)

      build_count = builds.count
      build = builds.last

      ENV['HEROKU_BUILD_COUNT']   = build_count.to_s
      ENV['HEROKU_BUILD_STATUS']  = build['status'].to_s
      ENV['HEROKU_RELEASED_AT']   = build['updated_at'].to_s
    rescue
      ENV['HEROKU_BUILD_COUNT']  ||= 'unknown'
      ENV['HEROKU_BUILD_STATUS'] ||= 'unknown'
      ENV['HEROKU_RELEASED_AT']  ||= 'unknown'
    end
  end
end
