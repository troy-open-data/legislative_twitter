module ApplicationHelper
  # Returns a vote tally
  #
  # @param roll_call [RollCall]
  # @result [String] '4-3-1' or 'no vote recorded'
  # TODO: Move to question model
  def print_votes(roll_call)
    votes = roll_call.votes
    if votes.empty?
      'no vote recorded'
    else
      "#{votes.yeas.count}-#{votes.nays.count}-#{votes.abstains.count}"
    end
  end

  # Returns a string of build information for the footer
  #
  # @return [String]
  def heroku_version
    time    = heroku_release_time
    count   = heroku_build_count
    status  = heroku_build_status

    "Last updated at #{time} (build ##{count} #{status})"
  rescue StandardError
    'Build information unavailable'
  end

  # Returns a string containing the attachment file's title and content type if
  # a title is available. Otherwise, returns a string of the original filename.
  #
  # @param attachment [Attachment]
  # @return [String]
  def file_name(attachment)
    if attachment.title.blank?
      attachment.file.original_filename
    else
      "#{attachment.title} (#{attachment.file.content_type})"
    end
  end

  # Returns a page-specific title
  #
  # @param title [String]
  # @return [String]
  def page_title(title = '')
    base_title = 'Troy City Tracker'
    title.blank? ? base_title : "#{title} | #{base_title}"
  end

  private

  def heroku_release_time
    DateTime.rfc3339(ENV['HEROKU_RELEASED_AT'])
        .in_time_zone('Eastern Time (US & Canada)')
        .strftime('%-l:%M%P EST %b %-d, %Y') || 'unknown'
  end

  def heroku_build_count
    ENV['HEROKU_BUILD_COUNT']   || 'unknown'
  end

  def heroku_build_status
    ENV['HEROKU_BUILD_STATUS']  || 'unknown'
  end
end
