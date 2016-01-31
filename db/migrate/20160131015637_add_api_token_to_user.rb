class AddApiTokenToUser < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end

  def change
    add_column :users, :api_token, :string
    User.find_each do |user|
      user.api_token = SecureRandom.urlsafe_base64(32)
      user.save!
    end
  end
end
