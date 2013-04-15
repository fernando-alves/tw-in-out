class InOutPresenter

  def initialize(in_out)
    @in_out = in_out
  end

  def in
    TimeFormatter.format @in_out.punch_in.time
  end

  def out
    TimeFormatter.format @in_out.punch_out.time
  end

  def hours
    TimeFormatter.format @in_out.hours
  end

end
