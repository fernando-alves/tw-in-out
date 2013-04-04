class Punch < ActiveRecord::Base
  attr_accessible :time, :kind, :user_id, :workday_id

  belongs_to :user
  belongs_to :workday
  validates :user, :time, :kind, :workday, :presence => true

  def self.all_by(params)
    where(user_id: params[:user].id, workday_id: params[:workday].id).order(:time)
  end

  def self.kinds
    [IN, OUT]
  end

  private
  IN = "IN"
  OUT = "OUT"

end
