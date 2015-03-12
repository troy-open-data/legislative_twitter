module ApplicationHelper
  # Returns a diff string containing changes or, if no changes, 'No Changes'
  def diff(content1, content2)
    changes = Diffy::Diff.new(content1, content2,
                              include_plus_and_minus_in_html: true)
    changes.to_s.present? ? changes.to_s(:html).html_safe : 'No Changes'
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

  # Takes input in the form of an html-rich string and returns an array of
  # prawn-sanitized paragraphs
  def prawnify_paragraphs(body, size=16)
    # Replace all headers with large text
    body = body.gsub(/\<h\d\>/,"<font size='#{size}'>").gsub(/\<\/h\d\>/,'</font><p>')
    # Remove all unexpected tags
    body = body.split(/\<\/?p\>/).delete_if{|p| p.empty?}

    body.map!{|paragraph| sanitize(paragraph, tags: %w{b i u strikethrough sub sup color font}, attributes: %w{size})}
  end
end
