class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  attr_accessible :email, :password, :name, :role, :labor_card, :admission_date
  has_many :punches
  has_many :workdays, through: :punches
  validates :email, format: { with: /@thoughtworks.com/ }

  def self.find_for_google_account(access_token, _signed_in_resource = nil)
    data = access_token.info
    if user = User.where(email: data['email']).first
      user
    else
      User.create!(email: data['email'], password: Devise.friendly_token[0, 20])
    end
  end

  def workdays_at(date)
    current_time = Time.zone.now
    year = date[:year] || current_time.year
    month = date[:month] || current_time.month

    Workday.joins(:punches).where('user_id = ? and extract(year from day) = ? and extract(month from day) = ?', id, year, month).uniq
  end
end
