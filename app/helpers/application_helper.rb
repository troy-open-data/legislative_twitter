# Application-wide helper methods
module ApplicationHelper
  # @param [RollCall] roll_call
  # @result [String] '4-3-1' or 'no vote recorded'
  def print_votes(roll_call)
    votes = roll_call.votes
    if votes.empty?
      'no vote recorded'
    else
      "#{votes.yeas.count}-#{votes.nays.count}-#{votes.abstains.count}"
    end
  end

  # Returns in title case either the short title (if it exists) or a truncated
  # version of the standard title for a piece of bill
  def short_title(bill)
    (bill.short_title || truncate(bill.title, length: 72)).titleize
  end

  # Returns a string of build information for the footer
  def heroku_version
    time = DateTime.rfc3339(ENV['HEROKU_RELEASED_AT'])
           .in_time_zone('Eastern Time (US & Canada)')
           .strftime('%-l:%M%P EST %b %-d, %Y') || 'unknown'
    count   = ENV['HEROKU_BUILD_COUNT'] || 'unknown'
    status  = ENV['HEROKU_BUILD_STATUS'] || 'unknown'

    # String construction
    "Last updated at #{time} (build ##{count} #{status})"
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
