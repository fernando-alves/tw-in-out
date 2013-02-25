class Punch < ActiveRecord::Base
  attr_accessible :time, :type, :user_id

  belongs_to :user
  validates :user, :presence => true

end
