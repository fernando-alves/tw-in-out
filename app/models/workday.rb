class Workday < ActiveRecord::Base
  include Hour::Countable

  attr_accessible :day

  has_many :punches
  validates :day, presence: true

  default_scope order(:day)

  def worked_hours_of(user)
    hours_of in_outs_of(user) || 0
  end

  def in_outs_of(user)
    punches = Punch.all_by(user: user, workday: self)
    Punch::InOut.create_for punches
  end
end
