class WorkdayPresenter
  attr_reader :workday
  delegate :day, to: :"@workday"

  def initialize(user, workday)
    @user, @workday = user, workday
  end

  def worked_hours
    TimeFormatter.format @workday.worked_hours_of(@user)
  end

  def in_outs_presenters
    @in_outs_presenters ||= create_in_outs_presenters
  end

  private
  def create_in_outs_presenters
    in_outs_presenters = []
    @workday.in_outs_of(@user).each do |in_out|
      in_outs_presenters << PunchInOutPresenter.new(in_out)
    end
    in_outs_presenters
  end

end
