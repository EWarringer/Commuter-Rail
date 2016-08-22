# Origin model ("North Station" and "South Station")
# See Train model
class Origin < ActiveRecord::Base

  validates :origin, presence: true
  has_many :trains

end
