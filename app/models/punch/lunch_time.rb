class Punch::LunchTime
  def initialize(user, workday)
    @user = user
    @workday = workday
  end

  def save
    create_lunch(kind: Punch::IN, hour: 12).save
    create_lunch(kind: Punch::OUT, hour: 13).save
  end

  private
  def create_lunch(params)
    date = @workday.day
    time = Time.zone.parse("#{date.year}-#{date.month}-#{date.day} #{params[:hour]}: 00")
    options = { kind: params[:kind], time: time }
    punch = Punch::Register.punch(@user, options)
    punch
  end
end
