# Application-wide helper methods
module ApplicationHelper
  # Returns in title case either the short title (if it exists) or a truncated
  # version of the standard title for a piece of bill
  def short_title(bill)
    (bill.short_title || truncate(bill.title, length: 72)).titleize
  end

  # Returns a string of build information for the footer
  def heroku_version
    # Read in values from environment variables
    released_at = DateTime.rfc3339(ENV['HEROKU_RELEASED_AT'])
                  .zone
                  .strftime('%-l:%M%P %b %-d, %Y')
    build_count = ENV['HEROKU_BUILD_COUNT'] || '?'
    build_status = ENV['HEROKU_BUILD_STATUS'] || 'unknown'

    # String construction
    "Last updated #{released_at} (build ##{build_count} #{build_status})"
  rescue StandardError
    'Build information unavailable'
  end

  # Returns a string containing the attachment file's title and content type if
  # a title is available. Otherwise, returns a string of the original filename.
  def file_name(attachment)
    if attachment.title.blank?
      attachment.file.original_filename
    else
      "#{attachment.title} (#{attachment.file.content_type})"
    end
  end
end
