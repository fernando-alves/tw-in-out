class Workday < ActiveRecord::Base
  attr_accessible :day

  has_many :punches
  validates :day, :presence => true

  default_scope order(:day)
end
