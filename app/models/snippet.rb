# == Schema Information
#
# Table name: snippets
#
#  id         :integer          not null, primary key
#  docket_id  :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Snippet < ActiveRecord::Base
  belongs_to :docket
end
