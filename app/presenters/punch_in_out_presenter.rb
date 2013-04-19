class PunchInOutPresenter
  delegate :punch_in, :punch_out, to: :"@in_out"

  def initialize(in_out)
    @in_out = in_out
  end

  def in
    @in_out.punch_in ? TimeFormatter.format(@in_out.punch_in.time) : ""
  end

  def out
    @in_out.punch_out ? TimeFormatter.format(@in_out.punch_out.time) : ""
  end

  def hours
    TimeFormatter.format_total(@in_out.hours || 0)
  end

end
