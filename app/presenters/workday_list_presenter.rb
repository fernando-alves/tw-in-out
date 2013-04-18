class WorkdayListPresenter
  include Hour::Counter
  attr_reader :workdays

  def initialize(user, workdays)
    @workdays = []
    workdays.each do |workday|
      @workdays <<  WorkdayPresenter.new(user, workday)
    end
  end

  def worked_hours
    TimeFormatter.format hours_of(workdays)
  end

end
