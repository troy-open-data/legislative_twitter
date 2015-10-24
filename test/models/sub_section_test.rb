# == Schema Information
#
# Table name: levels
#
#  id           :integer          not null, primary key
#  text         :text
#  heading      :string
#  subheading   :string
#  chapeau      :text
#  continuation :text
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  bill_id      :integer
#  level_id     :integer
#

require 'test_helper'

class SubSectionTest < ActiveSupport::TestCase
  should belong_to(:section)
  should have_many(:paragraphs)
  should accept_nested_attributes_for(:paragraphs)
end
