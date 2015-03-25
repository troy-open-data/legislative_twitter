require 'test_helper'

class LegislationsHelperTest < ActionView::TestCase
  include LegislationsHelper
  # ====== LEGISLATION BLURB GENERATORS ======
  # def truncated_body(legislation, length=200)
  #
  # returns the truncated body of a legislation, stripped of tags, with a note
  # of how many attachments the legislation has.
  # this is in the format: "...lorem ipsum... (with 2 attachments)"
  test 'truncated_body contains stripped body text' do
    legislation = create(:legislation)
    stripped_body = strip_tags(legislation.body)
    assert_match /#{stripped_body.first(20)}/i,
                 truncated_body(legislation, 50)
  end
  test 'truncated_body contains attachment information if attachments' do
    attached_legislation = create(:legislation_with_attachments,
                                  body: 'lorem ipsum')
    assert_match /attachment/i,
                 truncated_body(attached_legislation)
  end


  # def with_attachments(legislation)
  #
  # Returns nil or string containing attachment count for a piece of legislation
  # in the format "(with 3 attachments)"
  test 'with_attachments returns nil if no attachments' do
    unattached_legislation = create(:legislation)
    assert with_attachments(unattached_legislation).nil?
  end
  test 'with_attachments returns string describing attachments if attachments' do
    attachments_count = 5
    attached_legislation = create(:legislation_with_attachments,
                                  attachments_count: attachments_count)
    assert_match /#{pluralize(attachments_count, 'attachment')}/i,
                 with_attachments(attached_legislation)
  end


  # def meta_header(legislation)
  #
  # Returns a "metadata header" for legislation that includes type and creation
  # time in the format "Resolution | 3:24pm on 3/17/15"
  test 'meta_header contains legislation type' do
    legislation = create(:legislation)
    assert_match /#{legislation.legislation_type}/i,
                 meta_header(legislation)
  end




  # ====== LEGISLATION SHOW PAGE HELPERS ======
  # Returns a diff string containing changes or, if no changes, 'No Changes'
  # def diff(content1, content2)
  #   changes = Diffy::Diff.new(content1, content2,
  #                             include_plus_and_minus_in_html: true)
  #   changes.to_s.present? ? changes.to_s(:html).html_safe : 'No Changes'
  # end

  # Takes input in the form of an html-rich string and returns an array of
  # prawn-sanitized paragraphs
  # def prawnify_paragraphs(body, size=16)
  #   # Replace all headers with large text
  #   body = body.gsub(/\<h\d\>/,"<font size='#{size}'>").gsub(/\<\/h\d\>/,'</font><p>')
  #
  #   # Remove all unexpected tags
  #   body = body.split(/\<\/?p\>/).delete_if{|p| p.empty?}
  #
  #   body.map! do |paragraph|
  #     Sanitize.fragment(paragraph,
  #                       elements: %w{b i u strikethrough sub sup color font},
  #                       attributes: {
  #                           'font' => %w{size},
  #                           'color' => %w{}
  #                       })
  #   end
  # end




  # ====== CACHE NAMING ======
  # def recent_legislation_cache_name
  #
  # Returns an appropriate cache name for the legislation index page including
  # pagination params, in the format "recent_legislation_pg_3"
  test 'recent_legislation_cache_name includes page number' do
    params[:page] = 4
    assert_match /4/, recent_legislation_cache_name
  end
  test 'recent_legislation_cache_name defaults to 1' do
    assert_match /1/, recent_legislation_cache_name
  end

  # def changelog_cache_name(legislation)
  #
  # Returns an appropriate cache name for changelog cache, including legislation
  # id, in the format "legislation-52-changelog"
  test 'changelog_cache_name includes legislation id' do
    legislation = create(:legislation)
    assert_match /#{legislation.id}/, changelog_cache_name(legislation)
  end
end