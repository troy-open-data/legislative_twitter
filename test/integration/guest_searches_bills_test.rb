require 'test_helper'

class GuestSearchesBillsTest < ActionDispatch::IntegrationTest
  setup do
    create(:bill,
           title: 'Support the Troy Public Library',
           short_title: 'library')

    create(:bill,
           title: 'Ordinance for Financial Responsibility in Elections',
           short_title: 'elections')
    visit '/'
  end

  context 'A guest' do
    should 'be able to find a bill by title' do
      within '#search-form' do
        fill_in 'search', with: 'library'
        find('input[type=submit]').click
      end

      assert page.has_content?('Search Results'), 'not showing search results'
      assert page.has_content?('library'), 'not showing search term'
      assert_equal 1, all('.bill').count
    end
  end
end
