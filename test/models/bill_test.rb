# == Schema Information
#
# Table name: bills
#
#  id               :integer          not null, primary key
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  legislation_type :string           default("Resolution"), not null
#  short_title      :string
#  enacting_formula :string
#

require 'test_helper'

class BillTest < ActiveSupport::TestCase
  # Associations
  should have_many(:recitals)
  should accept_nested_attributes_for(:recitals)
         .allow_destroy(true)

  should have_many(:sections)
  should accept_nested_attributes_for(:sections)
         .allow_destroy(true)

  should have_many(:motions)
  should have_many(:roll_calls)
         .through(:motions)

  should have_many(:attachments)
  should accept_nested_attributes_for(:attachments)
         .allow_destroy(true)

  # Validations
  should validate_presence_of(:title)
  should validate_presence_of(:short_title)
  should validate_presence_of(:legislation_type)

  should validate_inclusion_of(:legislation_type)
         .in_array(Bill::LEGISLATION_TYPES)

  should 'have enacting formula default to \'Let it be hereby resolved\'' do
    bill = create(:bill, enacting_formula: nil)
    assert_equal 'Let it be hereby resolved', bill.enacting_formula
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

  def setup
    @bill = create(:bill)
  end

  test 'created_at_time should contain the year, month, and day of creation' do
    created_datetime = @bill.created_at
    created_string = @bill.created_at_time
    assert_match(/#{created_datetime.year}/, created_string,
                 'should contain the year of creation')
    assert_match(/#{Date::MONTHNAMES[created_datetime.month]}/, created_string,
                 'should contain the fulltext month of creation')
    assert_match(/#{created_datetime.day}/, created_string,
                 'should contain the day of creation')
  end

  test 'a newly created bill should increment once in position' do
    new_bill = create(:bill)
    assert_equal @bill.position + 1, new_bill.position
  end

  test 'bills should be numbered separately by legislation type' do
    create(:bill, legislation_type: Bill::LEGISLATION_TYPES[0], position: 200)
    create(:bill, legislation_type: Bill::LEGISLATION_TYPES[1], position: 300)

    new_bill = create(:bill, legislation_type: Bill::LEGISLATION_TYPES[0])
    assert_equal 201, new_bill.position
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
    @bill.update(title: 'New Title 2')
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
