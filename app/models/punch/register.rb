class Punch::Register

  def self.punch(user, options)
    punch = Punch.new options.merge(user_id: user.id)
    if punch.time
      punch.workday = Workday.find_or_create_by_day(punch.time.to_date)
    end
    punch
  end

end
