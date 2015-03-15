class Meeting < ActiveRecord::Base
  # Model Relationships
  belongs_to :organization
  has_one :docket, dependent: :destroy
end
