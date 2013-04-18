class WorkdayListPresenter
  attr_reader :workdays

  def initialize(user, workdays)
    @workdays = []
    workdays.each do |workday|
      @workdays <<  WorkdayPresenter.new(user, workday)
    end
  end

end
