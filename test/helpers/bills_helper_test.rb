require 'test_helper'

class BillsHelperTest < ActionView::TestCase
  include BillsHelper
  # def with_attachments(bill)
  #
  # Returns nil or string containing attachment count for a piece of bill
  # in the format "(with 3 attachments)"
  context '#with_attachments' do
    should 'return nil if no attachments' do
      unattached_bill = create(:bill)
      assert with_attachments(unattached_bill).nil?
    end
    should 'return string describing attachments if attachments' do
      attachments_count = 5
      attached_bill = create(:legislation_with_attachments,
                             attachments_count: attachments_count)
      assert_match(/#{pluralize(attachments_count, 'attachment')}/i,
                   with_attachments(attached_bill))
    end
  end

  # def meta_header(bill)
  #
  # Returns a "metadata header" for bill that includes type and creation
  # time in the format "Resolution 5 | 3:24pm on 3/17/15"
  test 'meta_header contains bill type' do
    bill = create(:bill)
    assert_match(/#{bill.numbering}/i,
                 meta_header(bill))
  end

  # ====== CACHE NAMING ======
  # def recent_legislation_cache_name
  #
  # Returns an appropriate cache name for the bill index page including
  # pagination params, in the format "recent_legislation_pg_3"
  test 'recent_legislation_cache_name includes page number' do
    params[:page] = 4
    assert_match(/4/, recent_bills_cache_name)
  end
  test 'recent_legislation_cache_name defaults to 1' do
    assert_match(/1/, recent_bills_cache_name)
  end

  # def changelog_cache_name(bill)
  #
  # Returns an appropriate cache name for changelog cache, including bill
  # id, in the format "bill-52-changelog"
  test 'changelog_cache_name includes bill id' do
    bill = create(:bill)
    assert_match(/#{bill.id}/, changelog_cache_name(bill))
  end
end
