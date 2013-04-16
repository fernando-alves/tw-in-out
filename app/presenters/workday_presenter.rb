class WorkdayPresenter
  attr_reader :workday, :in_outs

  def initialize(workday, punches)
    @workday = workday
    @in_outs = []
    Punch::InOut.create_for(punches).each do |in_out|
      @in_outs << InOutPresenter.new(in_out)
    end
  end

end
