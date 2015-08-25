require 'test_helper'

class GuestBrowsesBillsTest < ActionDispatch::IntegrationTest
  setup do
    15.times { create(:bill) }
    visit '/'
  end

  context 'A guest' do
    should 'see a paginated list of bills on the index page' do
      click_link 'Bill'

      bills_per_page = 10
      within '#bills' do
        assert_equal bills_per_page, all('.bill').count
      end

      assert page.has_css? 'ul.pagination'
    end

    should 'be able to navigate to a specific bill' do
      click_link 'Bill'
      all('.bill a').first.click

      # tabbed links
      assert page.has_css? 'ul.tabs'
      assert page.has_content? 'Full Text'
      assert page.has_content? 'Vote History'
      assert page.has_content? 'Changelog'
    end

    should 'be able to open the pdf rendering of a bill from the index page' do
      click_link 'Bill'

      within all('.bill').first do
        click_link 'PDF'
        assert_match 'pdf', current_path
      end
    end

    should 'be able to open the pdf rendering of a bill from the bill page' do
      click_link 'Bill'
      all('.bill a').first.click

      click_link 'PDF'
      assert_match 'pdf', current_path
    end
  end
end
