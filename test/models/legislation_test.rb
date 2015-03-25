# == Schema Information
#
# Table name: legislations
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  legislation_type :string           default("Resolution"), not null
#  short_title      :string
#

require 'test_helper'

class LegislationTest < ActiveSupport::TestCase
  ## Setup and Teardown ########################################################
  def setup
    @legislation = create(:legislation)
  end

  ## Associations ##############################################################
  test 'has many status updates' do
    assert @legislation.respond_to? :status_updates
  end
  test 'has many statuses' do
    assert @legislation.respond_to? :statuses
  end
  test 'has many folios' do
    assert @legislation.respond_to? :folios
  end
  test 'has many meetings' do
    assert @legislation.respond_to? :meetings
  end
  test 'has many attachments' do
    assert @legislation.respond_to? :attachments
  end

  ## Validations ###############################################################
  test 'must have title' do
    @legislation.update(title: nil)
    assert_not @legislation.save, 'saved legislation without a title'
  end
  test 'must have body' do
    @legislation.update(body: nil)
    assert_not @legislation.save, 'saved legislation without a body'
  end
  test 'must have legislation type' do
    @legislation.update(legislation_type: nil)
    assert_not @legislation.save, 'saved legislation without a type'
  end
  test 'legislation type must be from allowed types' do
    @legislation.update(legislation_type: 'Invalid Type')
    assert_not @legislation.save, 'saved legislation with an invalid type'
  end

  ## Scopes and Class Methods ##################################################
  test 'has resolutions scope' do
    assert Legislation.respond_to? :resolutions
  end
  test 'has ordinances scope' do
    assert Legislation.respond_to? :resolutions
  end
  # test 'latest'


  ## Instance Methods ##########################################################

  # Text Output
  test 'created_at_time should contain the year, month, and day of creation' do
    created_datetime = @legislation.created_at
    created_string = @legislation.created_at_time
    assert_match /#{created_datetime.year}/, created_string,
                 'should contain the year of creation'
    assert_match /#{Date::MONTHNAMES[created_datetime.month]}/, created_string,
                 'should contain the fulltext month of creation'
    assert_match /#{created_datetime.day}/, created_string,
                 'should contain the day of creation'
  end

  # test 'legislative_numbering'
  # test 'collection_text_method'

  # Diff Methods
  test 'should return changed attributes of the last version' do
    @legislation.update(title: 'New Title')
    @legislation.save!

    diff_attributes = @legislation.diff_attributes
    assert_equal ['title'], diff_attributes
  end

  test 'should return changed attributes in a given version' do
    @legislation.update(title: 'New Title')
    @legislation.save!
    @legislation.update(body: 'New Body')
    @legislation.save!

    version = @legislation.versions[-2]

    diff_attributes = @legislation.diff_attributes version
    assert_equal ['title'], diff_attributes
  end



  # Paper Trail Tests
  test 'legislations should have paper trails' do
    assert @legislation.respond_to? :versions
  end

  test 'new legislations should have one version marking creation' do
    assert_equal 1, @legislation.versions.count
    assert_equal 'create', @legislation.versions.last.event
  end

  test 'updating legislation should add version marking update' do
    assert_difference('@legislation.versions.count') do
      @legislation.update(title: 'New Title')
    end
    assert_equal 'update', @legislation.versions.last.event
  end

  test 'deleting legislation should add version marking destroy' do
    assert_difference('@legislation.versions.count') do
      @legislation.destroy
    end
    assert_equal 'destroy', @legislation.versions.last.event
  end

  test 'legislations should have paper trail changesets' do
    assert @legislation.versions.last.respond_to? :changeset
  end
end
