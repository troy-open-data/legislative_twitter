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

class ParagraphTest < ActiveSupport::TestCase
  should belong_to(:sub_section).class_name('SubSection').with_foreign_key('level_id')
  should have_many(:sub_paragraphs).with_foreign_key('level_id').dependent(:destroy)
  should accept_nested_attributes_for(:sub_paragraphs).allow_destroy(true)
end
