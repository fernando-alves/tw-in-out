class Given

  def self.a_in_out(options)
    at_day = options[:at_day] || 1
    punch_in, punch_out = options[:punch_in], options[:punch_out]
    Punch::InOut.new(punch_in: Given.a_punch(on: at_day, at: punch_in),
                     punch_out: Given.a_punch(on: at_day, at: punch_out))
  end

  def self.a_workday_counter(*in_outs)
    Workday::Counter.new in_outs: in_outs
  end

  def self.a_punch(options)
    if options[:at]
      Punch.new time: Time.zone.parse("2013-1-#{options[:on]} #{options[:at]}")
    end
  end

  def self.a_punches_at(*hours)
    punches = []
    hours.each { |h| punches << a_punch(on: 1, at: h)  }
    punches
  end

  def self.a_in_out_presenter_with(options)
    PunchInOutPresenter.new Given.a_in_out(options)
  end
end
