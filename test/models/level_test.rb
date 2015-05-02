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

class LevelTest < ActiveSupport::TestCase
  context 'Level subclasses' do
    should 'include Section' do
      assert create(:section)
    end
    should 'include SubSection' do
      assert create(:sub_section)
    end
    should 'include Paragraph' do
      assert create(:paragraph)
    end
    should 'include SubParagraph' do
      assert create(:sub_paragraph)
    end
  end

  context 'a valid level' do
  end

end
