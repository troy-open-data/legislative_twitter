require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  # def short_title(legislation)
  #
  # Returns in title case either the short title (if it exists) or a truncated
  # version of the standard title for a piece of legislation
  test 'short_title helper should return short_title attribute if it exists' do
    short_title = 'Short Title'
    titled_legislation = create(:legislation, short_title: short_title)
    assert_match /#{short_title(titled_legislation)}/i,
                 titled_legislation.short_title
  end
  test 'short_title helper should return truncated title if no short_title attribute' do
    untitled_legislation = create(:legislation)
    assert_match /#{short_title(untitled_legislation).first(20)}/i,
                 untitled_legislation.title
  end

  # def heroku_version
  # Returns a string of build information for the footer
  test 'heroku_version should return a string containing build information' do
    assert_match /(Last updated (.*) \(build #(.*) (.*)\))||(Previous build information unavailable)/i,
                 heroku_version
  end

  # def file_name(attachment)
  #
  # Returns a string containing the attachment file's title and content type if
  # a title is available. Otherwise, returns a string of the original filename.
  test 'file_name should contain attachment title if attachment has a title' do
    titled_attachment = create(:attachment, title: 'Image')
    assert_match /#{titled_attachment.title}/i,
                 file_name(titled_attachment)
  end
  test 'file_name should contain original filename if no title' do
    untitled_attachment = create(:attachment)
    assert_match /#{untitled_attachment.file.original_filename}/i,
                 file_name(untitled_attachment)
  end
end