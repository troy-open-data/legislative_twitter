require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  context 'given a motion' do
    setup { @roll_call = create(:roll_call) }
    context '#print_votes' do
      context 'with no votes' do
        should 'return string of vote summary' do
          assert_equal 'no vote recorded', print_votes(@roll_call)
        end
      end
      context 'with votes' do
        setup { @roll_call.votes << create(:vote, roll_call: @roll_call) }
        should 'return string of vote summary' do
          assert_match(/\d-\d-\d/, print_votes(@roll_call))
        end
      end
    end
  end

  context '#heroku_version' do
    should 'return a string containing build information' do
      # TODO: Test with fixture
      regex = /(Last updated (.*) \(build #(.*) (.*)\))||(Build information unavailable)/i
      assert_match regex, heroku_version
    end
  end

  context '#file_name' do
    should 'return attachment title if attachment has a title' do
      titled_attachment = create(:attachment, title: 'Image')
      assert_match(/#{titled_attachment.title}/i,
                   file_name(titled_attachment))
    end
    should 'return original filename if no title' do
      untitled_attachment = create(:attachment)
      assert_match(/#{untitled_attachment.file.original_filename}/i,
                   file_name(untitled_attachment))
    end
  end

  context '#page_title' do
    setup { @base_title = 'Troy City Tracker' }
    context 'given a page name' do
      should 'return a specific page title' do
        output = page_title 'Specific Page'
        assert_equal "Specific Page | #{@base_title}", output
      end
    end
    context 'given no page name' do
      should 'return a base page title' do
        output = page_title
        assert_equal @base_title, output
      end
    end
  end
end
