class WorkdayListPresenter
  include Hour::Countable
  attr_reader :workdays

  def initialize(user, workdays)
    @workdays = []
    workdays.each do |workday|
      @workdays << WorkdayPresenter.new(user, workday)
    end
  end

  def worked_hours
    TimeFormatter.format_total hours_of(workdays)
  end
end
