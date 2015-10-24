require 'test_helper'

class GuestBrowsesOrganizationsTest < ActionDispatch::IntegrationTest
  context 'A guest' do
    setup do
      @general_assembly = create(:organization,
                                 name: 'General Assembly',
                                 level: 1,
                                 description: 'The main meeting for the council.')
      @finance_committee = create(:organization, name: 'Finance Committee', level: 2)

      visit '/'
      click_link 'Organizations'
    end

    should 'see a list of organizations on the index page' do
      assert page.has_css?('#organizations'), 'no organizations container'
      assert_equal 2, all('.organization').count
    end

    should 'be able to navigate to an organization' do
      # add meetings to general assembly
      2.times { create(:meeting, organization: @general_assembly) }
      # add joe to general assembly
      joe = create(:person, first: 'Joe', last: 'Dobbs')
      @general_assembly.people << joe
      @general_assembly.save!

      within all('.organization').first do
        click_link 'Show'
      end

      # basic information
      assert page.has_content? 'General Assembly'
      assert page.has_content? 'The main meeting for the council.'

      # are memberships listed properly?
      assert page.has_content? 'Membership'
      assert page.has_css? '#members'
      assert_equal 1, all('.member').count

      # are organization meetings listed properly?
      assert page.has_content? 'Meetings'
      assert page.has_css? '#meetings'
      assert_equal 2, all('.meeting').count
    end

    should 'be able to navigate to an organization member from the organization page' do
      joe = create(:person, first: 'Joe', last: 'Dobbs')
      @general_assembly.people << joe
      @general_assembly.save!

      within(all('.organization').first) { click_link 'Show' }
      within('#members')                 { all('a').first.click }

      assert_equal person_path(joe), current_path
    end

    should 'be able to navigate to an organization meeting from the organization page' do
      meeting = create(:meeting, organization: @general_assembly)

      within(all('.organization').first) { click_link 'Show' }
      within('#meetings')                { all('a').first.click }

      assert_equal meeting_path(meeting), current_path
    end
  end
end
