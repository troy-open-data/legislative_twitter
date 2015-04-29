# == Schema Information
#
# Table name: bills
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  legislation_type :string           default("Resolution"), not null
#  short_title      :string
#  enacting_formula :string
#

require 'test_helper'

class BillTest < ActiveSupport::TestCase
  ## Setup and Teardown ########################################################
  def setup
    @bill = create(:bill)
  end

  should 'have many recitals' do
    assert should_have_many Bill, :recitals
  end
  should 'have many sections' do
    assert should_have_many Bill, :sections
  end

  ## Validations ###############################################################
  test 'must have title' do
    assert should_validate_presence_of :title, :bill
  end
  should 'have short title' do
    assert should_validate_presence_of :short_title, :bill
  end
  test 'must have bill type' do
    assert should_validate_presence_of :legislation_type, :bill
  end
  should 'have enacting formula default to \'Let it be hereby resolved\' if nil' do
    bill = create(:bill, enacting_formula: nil)
    assert_equal 'Let it be hereby resolved', bill.enacting_formula
  end
  test 'bill type must be from allowed types' do
    @bill.update(legislation_type: 'Invalid Type')
    assert_not @bill.save, 'saved bill with an invalid type'
  end

  ## Scopes and Class Methods ##################################################
  test 'has resolutions scope' do
    assert Bill.respond_to? :resolutions
  end
  test 'has ordinances scope' do
    assert Bill.respond_to? :resolutions
  end
  test 'has by_recent scope' do
    assert Bill.respond_to? :by_recent
  end
  test 'by_recent orders by created_at in descending order' do
    assert_equal Bill.order('created_at DESC'),
                 Bill.by_recent
  end
  # test 'latest'


  ## Instance Methods ##########################################################

  # Text Output
  test 'created_at_time should contain the year, month, and day of creation' do
    created_datetime = @bill.created_at
    created_string = @bill.created_at_time
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
    @bill.update(title: 'New Title')
    @bill.save!

    diff_attributes = @bill.diff_attributes
    assert_equal ['title'], diff_attributes
  end

  test 'should return changed attributes in a given version' do
    @bill.update(title: 'New Title')
    @bill.save!
    @bill.update(body: 'New Body')
    @bill.save!

    version = @bill.versions[-2]

    diff_attributes = @bill.diff_attributes version
    assert_equal ['title'], diff_attributes
  end



  # Paper Trail Tests
  test 'Bills should have paper trails' do
    assert @bill.respond_to? :versions
  end

  test 'new Bills should have one version marking creation' do
    assert_equal 1, @bill.versions.count
    assert_equal 'create', @bill.versions.last.event
  end

  test 'updating bill should add version marking update' do
    assert_difference('@bill.versions.count') do
      @bill.update(title: 'New Title')
    end
    assert_equal 'update', @bill.versions.last.event
  end

  test 'deleting bill should add version marking destroy' do
    assert_difference('@bill.versions.count') do
      @bill.destroy
    end
    assert_equal 'destroy', @bill.versions.last.event
  end

  test 'Bills should have paper trail changesets' do
    assert @bill.versions.last.respond_to? :changeset
  end
end
