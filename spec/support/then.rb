class Then
  def self.an_hour_of(hours)
    TimeFormatter.format(hours)
  end

  def self.total_hour_of(hours)
    TimeFormatter.format_total(hours)
  end
end
