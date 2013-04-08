class Punch < ActiveRecord::Base
  attr_accessible :time, :kind, :user_id, :workday_id

  belongs_to :user
  belongs_to :workday
  validates :user, :time, :kind, :workday, :presence => true

  default_scope order(:time)

  def self.all_by(params)
    where(user_id: params[:user].id, workday_id: params[:workday].id)
  end

  def self.kinds
    [IN, OUT]
  end

  private
  IN = "IN"
  OUT = "OUT"

end
