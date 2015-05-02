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

class SectionTest < ActiveSupport::TestCase
  should belong_to(:bill)
  should have_many(:sub_sections)
  should accept_nested_attributes_for(:sub_sections)
end
