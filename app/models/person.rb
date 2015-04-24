class Person < ActiveRecord::Base
  validates :first, presence: true
  validates :last,  presence: true
end
