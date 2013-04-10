class Punch::Register

  def self.punch(user, options)
    options[:user_id] = user.id
    punch = Punch.new(options)
    if punch.time
      punch.workday = Workday.find_or_create_by_day(punch.time.to_date)
    end
    punch
  end

end
