module ApplicationHelper

  # Returns a string of build information for the footer
  def heroku_version
    begin
      # Read in values from environment variables
      released_at = DateTime.rfc3339(ENV['HEROKU_RELEASED_AT']).
        in_time_zone('Eastern Time (US & Canada)').
        strftime("%-l:%M%P %b %-d, %Y")
      build_count = ENV['HEROKU_BUILD_COUNT'] || '?'
      build_status = ENV['HEROKU_BUILD_STATUS'] || 'unknown'

      # String construction
      "Last updated #{released_at} (build ##{build_count} #{build_status})"
    rescue StandardError
      'Previous build information unavailable'
    end
  end

end
