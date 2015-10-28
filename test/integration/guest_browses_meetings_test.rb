require 'test_helper'

class GuestBrowsesMeetingsTest < ActionDispatch::IntegrationTest
  setup do
    council = create(:organization, name: 'City Council')
    5.times { create(:meeting, organization: council) }

    finance_committee = create(:organization, name: 'Finance Committee')
    3.times { create(:meeting, organization: finance_committee) }
    visit '/'

    within 'nav.site-nav' do
      click_link 'Calendar'
    end
  end

  context 'A guest' do
    should 'see a list of meetings' do
      assert page.has_css? 'table.city-council-meetings'
      within 'table.city-council-meetings' do
        assert_equal 5, all('tr.meeting').count
      end

      assert page.has_css? 'table.finance-committee-meetings'
      within 'table.finance-committee-meetings' do
        assert_equal 3, all('tr.meeting').count
      end
    end

    should 'be able to navigate to a meeting' do
      within all('tr.meeting').first do
        click_link 'Details'
      end

      # does the page have the right meeting information?
      assert page.has_content? 'City Council Meeting'
      assert page.has_content? 'Date'
      assert page.has_content? 'Time'
      assert page.has_content? 'Location'
      assert page.has_content? 'Bills'

      # does the page have the right downloads and media?
      assert page.has_content? 'Downloads'
      assert page.has_content? 'Agenda'
      assert page.has_content? 'Minutes'
      assert page.has_content? 'Stream'
    end

    context 'looking at a future meeting' do
      setup do
        future = create(:organization, name: 'Future')
        @future_meeting = create(:meeting,
                                 organization: future,
                                 date_and_time: Date.tomorrow)
        within 'nav.site-nav' do
          click_link 'Calendar'
        end
      end

      context 'on the index page' do
        should 'see html and pdf links to the meeting agenda' do
          within 'table.future-meetings td.agenda' do
            agenda_links = all('a').map { |a| a[:href] }
            assert_includes agenda_links, agenda_path(@future_meeting)
            assert_includes agenda_links, agenda_path(@future_meeting, format: :pdf)
          end
        end

        should 'see a placeholder instead of links to the meeting minutes' do
          within 'table.future-meetings td.minutes' do
            assert_empty all('a')
            assert page.has_content? 'Upcoming'
          end
        end
      end

      context 'on the show page' do
        setup do
          within 'table.future-meetings' do
            click_link 'Details'
          end
        end

        should 'not link to minutes' do
          refute page.has_link? 'Minutes'
          refute page.has_link? '', href: minutes_path(@future_meeting)
          refute page.has_link? '', href: minutes_path(@future_meeting, format: :pdf)
        end

        should 'link to the agenda pdf' do
          assert page.has_link? '', href: agenda_path(@future_meeting, format: :pdf)
        end

        should 'link to the agenda html page' do
          assert page.has_link? '', href: agenda_path(@future_meeting)
        end
      end
    end

    context 'looking at a past meeting' do
      setup do
        past = create(:organization, name: 'Past')
        @past_meeting = create(:meeting,
                               organization: past,
                               date_and_time: 1.year.ago)

        within 'nav.site-nav' do
          click_link 'Calendar'
        end
      end

      context 'on the index page' do
        should 'see html and pdf links to the meeting minutes' do
          within 'table.past-meetings td.minutes' do
            minutes_links = all('a').map { |a| a[:href] }
            assert_includes minutes_links, minutes_path(@past_meeting)
            assert_includes minutes_links, minutes_path(@past_meeting, format: :pdf)
          end
        end
      end

      context 'on the show page' do
        setup do
          within 'table.past-meetings' do
            click_link 'Details'
          end
        end

        should 'link to the minutes html page' do
          assert page.has_link? '', href: minutes_path(@past_meeting)
        end

        should 'link to the minutes pdf' do
          assert page.has_link? '', href: minutes_path(@past_meeting, format: :pdf)
        end
      end
    end
  end
end
