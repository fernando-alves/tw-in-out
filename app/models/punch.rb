class Punch < ActiveRecord::Base
  attr_accessible :time, :kind, :user_id, :workday_id

  belongs_to :user
  belongs_to :workday
  validates :user, :time, :kind, :workday, :presence => true

  default_scope order(:time)

  scope :all_by, lambda { |params| where(user_id: params[:user].id, workday_id: params[:workday].id) }

  def self.next_by(user)
    last_one = unscoped.find_last_by_user_id(user.id)
    kind = last_one ? last_one.next_kind : IN
    self.new(kind: kind)
  end

  def self.kinds
    [IN, OUT]
  end

  def next_kind
    options = { IN: Punch::OUT, OUT: Punch::IN }
    options[kind.to_sym]
  end

  private
  IN = "IN"
  OUT = "OUT"

end
