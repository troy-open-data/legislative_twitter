module LegislationsHelper
  # ====== LEGISLATION BLURB GENERATORS ======
  # returns the truncated body of a legislation, stripped of tags, with a note
  # of how many attachments the legislation has.
  # this is in the format: "...lorem ipsum... (with 2 attachments)"
  def truncated_body(legislation, length=200)
    truncate(strip_tags(legislation.body), length: length) +
        with_attachments(legislation)
  end

  # Returns nil or string containing attachment count for a piece of legislation
  # in the format "(with 3 attachments)"
  def with_attachments(legislation)
    unless legislation.attachments.empty?
      "(with #{pluralize legislation.attachments.count, 'attachment'})"
    end
  end

  # Returns a "metadata header" for legislation that includes type and creation
  # time in the format "Resolution | 3:24pm on 3/17/15"
  def meta_header(legislation)
    legislation.legislation_type + ' | ' + legislation.created_at.strftime('%-l:%M%P on %m/%d/%y')
  end




  # ====== LEGISLATION SHOW PAGE HELPERS ======
  # Returns a diff string containing changes or, if no changes, 'No Changes'
  def diff(content1, content2)
    changes = Diffy::Diff.new(content1, content2,
                              include_plus_and_minus_in_html: true)
    changes.to_s.present? ? changes.to_s(:html).html_safe : 'No Changes'
  end

  # Takes input in the form of an html-rich string and returns an array of
  # prawn-sanitized paragraphs
  def prawnify_paragraphs(body, size=16)
    # Replace all headers with large text
    body = body.gsub(/\<h\d\>/,"<font size='#{size}'>").gsub(/\<\/h\d\>/,'</font><p>')

    # Remove all unexpected tags
    body = body.split(/\<\/?p\>/).delete_if{|p| p.empty?}

    body.map! do |paragraph|
      Sanitize.fragment(paragraph,
                        elements: %w{b i u strikethrough sub sup color font},
                        attributes: {
                            'font' => %w{size},
                            'color' => %w{}
                        })
    end
  end




  # ====== CACHE NAMING ======
  # Returns an appropriate cache name for the legislation index page including
  # pagination params, in the format "recent_legislation_pg_3"
  def recent_legislation_cache_name
    "recent_legislation_pg_#{(params[:page] || '1').to_s}"
  end

  # Returns an appropriate cache name for changelog cache, including legislation
  # id, in the format "legislation-52-changelog"
  def changelog_cache_name(legislation)
    "legislation-#{legislation.id}-changelog"
  end

end
