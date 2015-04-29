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

class Section < Level
  belongs_to :bill
  has_many :sub_sections, foreign_key: 'level_id', dependent: :destroy
  accepts_nested_attributes_for :sub_sections,
                                allow_destroy: true
end
