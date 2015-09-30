class TimeFormatter
  def self.format(elapsed_time)
    Time.zone.at(elapsed_time).strftime('%H:%M')
  end

  def self.format_total(elapsed_time)
    hours = elapsed_time / 3600
    (hours.to_f).round(1)
  end

  def self.format_date_time(elapsed_time)
    Time.zone.at(elapsed_time).strftime('%d/%m/%y %H:%M')
  end
end
