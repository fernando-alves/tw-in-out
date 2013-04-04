class Punch::Register

  def self.punch(user, options)
    options[:user_id] = user.id
    punch = Punch.new(options)
    workday = Workday.find_or_create_by_day(punch.time)
    punch.workday = workday
    punch
  end

end
