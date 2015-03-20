class Punch::LunchTime
  def initialize(user, workday)
    @user = user
    @workday = workday
  end

  def save
    create_lunch(hour: 12).save
    create_lunch(hour: 13).save
  end

  private

  def create_lunch(params)
    time = Time.zone.parse("#{date.year}-#{date.month}-#{date.day} #{params[:hour]}: 00")

    Punch::Register.punch(@user, time: time)
  end

  def date
    @workday.day
  end
end
