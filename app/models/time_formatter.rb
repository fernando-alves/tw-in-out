class TimeFormatter
  def self.format(hours)
    Time.at(hours).utc.strftime("%H:%M")
  end
end
