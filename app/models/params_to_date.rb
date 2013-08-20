class ParamsToDate
  def initialize(date)
    @date = date
    @current_time = Time.zone.now
    @pattern = %r/(?<year>\d*)-(?<month>\d*)/
  end

  def year
    valid_date? ? match[:year] : @current_time.year
  end

  def month
    (valid_date? ? match[:month] : @current_time.month).to_s.rjust(2, '0')
  end

  def date
    "#{year}-#{month}"
  end

  private
  def valid_date?
    @date && match
  end

  def match
    @pattern.match @date
  end
end
