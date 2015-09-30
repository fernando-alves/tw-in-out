class Punch < ActiveRecord::Base
  belongs_to :user
  belongs_to :workday
  validates :user, :time, :workday, presence: true

  default_scope { order(:time) }

  scope :all_by, ->(params) { where(user_id: params[:user].id, workday_id: params[:workday].id) }
end
