# Helper methods for bills views
module BillsHelper
  # @param [Bill] bill
  # @return [String] "(with X attachments)"
  def with_attachments(bill)
    return if bill.attachments.empty?
    "(with #{pluralize bill.attachments.count, 'attachment'})"
  end

  # @param [Bill] bill
  # @return [String] "Resolution 5 | 3:24pm on 3/17/15"
  def meta_header(bill)
    bill.numbering + ' | ' +
      bill.created_at.to_formatted_s(:long_ordinal)
  end

  # @param [String] content1 old comparison string
  # @param [String] content2 new comparison string
  # @return [String] Returns a diff string containing changes or,
  #   if no changes, 'No Changes'
  def diff(content1, content2)
    changes = Diffy::Diff.new(content1, content2,
                              include_plus_and_minus_in_html: true)
    changes.to_s.present? ? changes.to_s(:html).html_safe : 'No Changes'
  end

  # Cache Helpers
  #
  # @return [String] Returns an appropriate cache name for the bill index page
  #   including pagination params, in the format "recent_legislation_pg_3"
  def recent_bills_cache_name
    "recent_legislation_pg_#{(params[:page] || '1')}"
  end

  # @param [Bill]
  # @return [String] Returns an appropriate cache name for changelog cache,
  #   including bill id, in the format "bill-52-changelog"
  def changelog_cache_name(bill)
    "bill-#{bill.id}-changelog"
  end
end
