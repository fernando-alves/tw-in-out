class Punch < ActiveRecord::Base
  attr_accessible :time, :kind, :user_id, :workday_id

  belongs_to :user
  belongs_to :workday
  validates :user, :time, :kind, :workday, :presence => true

  def self.build_with(current_user, options)
    options[:user_id] = current_user.id
    self.new(options)
  end

  def self.all_by(user)
    where(user_id: user.id).order(:time)
  end

  def self.kinds
    [IN, OUT]
  end

  private
  IN = "IN"
  OUT = "OUT"

end
