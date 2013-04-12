class Given
  def self.a_punch_counter(*punches)
    Punch::Counter.new punches
  end

  def self.a_punch(options)
    options[:on] ||= 1
    Punch.new time: Time.zone.parse("2013-1-#{options[:on]} #{options[:at]}")
  end
end
