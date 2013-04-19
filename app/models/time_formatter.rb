class TimeFormatter
  def self.format(elapsed_time)
    Time.at(elapsed_time).utc.strftime("%H:%M")
  end

  def self.format_total(elapsed_time)
    hours = elapsed_time/3600
    (hours.to_f).round(1)
  end

end
