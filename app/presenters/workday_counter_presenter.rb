class WorkdayCounterPresenter
  attr_reader :workdays

  def initialize(user, workdays)
    @workdays = []
    workdays.each do |workday|
      punches = Punch.all_by(user: user, workday: workday)
      @workdays <<  WorkdayPresenter.new(workday, punches)
    end
  end

end
