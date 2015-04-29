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

  context 'a section' do
    context 'with associations' do
      should 'belong to a bill' do
        assert should_belong_to Section, :bill
      end
      should 'have many sub-sections' do
        assert should_have_many Section, :sub_sections
      end
    end
  end

  context 'a subsection' do
    context 'with associations' do
      should 'belong to a section' do
        assert should_belong_to SubSection, :section
      end
      should 'have many paragraphs' do
        assert should_have_many SubSection, :paragraphs
      end
    end
  end

  context 'a paragraph' do
    context 'with associations' do
      should 'belong to a sub-section' do
        assert should_belong_to Paragraph, :sub_section
      end
      should 'have many sub-paragraphs' do
        assert should_have_many Paragraph, :sub_paragraphs
      end
    end
  end

  context 'a sub-paragraph' do
    context 'with associations' do
      should 'belong to a paragraph' do
        assert should_belong_to SubParagraph, :paragraph
      end
    end
  end
end
