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

class SubSection < Level
  belongs_to :section, class_name: 'Section', foreign_key: 'level_id'
  has_many :paragraphs, foreign_key: 'level_id', dependent: :destroy
  accepts_nested_attributes_for :paragraphs,
                                allow_destroy: true
end
