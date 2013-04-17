class WorkdayPresenter
  attr_reader :workday, :in_outs_presenters
  delegate :day, to: :"@workday"

  def initialize(workday, punches)
    @workday = workday
    @in_outs_presenters = []
    @in_outs = Punch::InOut.create_for(punches)
    @in_outs.each do |in_out|
      @in_outs_presenters << PunchInOutPresenter.new(in_out)
    end
  end

  def worked_hours
    TimeFormatter.format(Workday::Counter.new(in_outs: @in_outs).hours || 0)
  end

end
