class Punch < ActiveRecord::Base
  attr_accessible :time, :kind, :user_id

  belongs_to :user
  validates :user, :time, :kind, :presence => true

  def self.build_with(current_user, options)
    options[:user_id] = current_user.id
    self.new(options)
  end

end
