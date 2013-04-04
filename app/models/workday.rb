class Workday < ActiveRecord::Base
  attr_accessible :day

  has_many :punches
  validates :day, :presence => true
end
