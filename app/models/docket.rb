class Docket < ActiveRecord::Base
  belongs_to :meeting, dependent: :destroy
  has_many :snippets, dependent: :destroy
end
