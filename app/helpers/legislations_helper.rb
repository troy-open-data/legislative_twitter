module LegislationsHelper
  # Prints the changes between a given version and the previous one in the
  # format: "Changed attr1, attr2, attr3 (time changed)"

  # Returns in title case either the short title (if it exists) or a truncated
  # version of the standard title for a piece of legislation
  def short_title(legislation)
    short_title = legislation.short_title || truncate(legislation.title, length: 128)
    short_title.titleize
  end

  # Returns nil or string containing attachment count for a piece of legislation
  # in the format "(with 3 attachments)"
  def with_attachments(legislation)
    unless legislation.attachments.empty?
      "(with #{pluralize legislation.attachments.count, 'attachment'})"
    end
  end

  def meta_header(legislation)
    legislation.legislation_type + ' | ' + legislation.created_at.strftime("%-l:%M%P on %m/%d/%y")
  end
end
