require 'test_helper'

class GuestBrowsesBillsTest < ActionDispatch::IntegrationTest
  setup do
    15.times { create(:bill) }
    visit '/'

    within 'nav.site-nav' do
      click_link 'Bills'
    end
  end

  context 'A guest' do
    should 'see a paginated list of bills on the index page' do
      bills_per_page = 5
      within '#bills' do
        assert_equal bills_per_page, all('.bill').count
      end

      assert page.has_css? '.pagination'
    end

    should 'be able to navigate to a specific bill' do
      within all('.bill').first do
        click_link 'Show'
      end

      # tabbed links
      assert page.has_css? 'ul.tabs'
      assert page.has_content? 'Full Text'
      assert page.has_content? 'Vote History'
      assert page.has_content? 'Changelog'
    end

    should 'be able to open the pdf rendering of a bill from the index page' do
      within all('.bill').first do
        click_link 'PDF'
        assert_match 'pdf', current_path
      end
    end

    should 'be able to open the pdf rendering of a bill from the bill page' do
      within all('.bill').first do
        click_link 'Show'
      end

      click_link 'bill only'
      assert_match 'pdf', current_path
    end
  end
end
