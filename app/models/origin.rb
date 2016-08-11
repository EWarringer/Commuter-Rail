# see Train model
class Origin < ActiveRecord::Base

  validates :origin, presence: true
  has_many :trains

end
