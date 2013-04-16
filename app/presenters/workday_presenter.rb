class WorkdayPresenter
  attr_reader :workday, :in_outs_presenters

  def initialize(workday, punches)
    @workday, @punches = workday, punches
    @in_outs_presenters = []
    in_outs.each do |in_out|
      @in_outs_presenters << InOutPresenter.new(in_out)
    end
  end

  def in_outs
    @in_outs ||= Punch::InOut.create_for(@punches)
  end

end
