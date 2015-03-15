module ApplicationHelper
  # Returns a string of version information for the footer
  def heroku_version
    begin
      released_at = DateTime.rfc3339(ENV['HEROKU_RELEASED_AT']).
        in_time_zone('Eastern Time (US & Canada)').
        strftime("%-l:%M%P %b %-d, %Y")
      "Last updated #{released_at}"
    rescue StandardError
      'Last updated time unavailable'
    end
  end
end
