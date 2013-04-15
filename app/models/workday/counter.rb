class Workday::Counter

  def initialize(params)
    @in_outs = params[:in_outs]
  end

  def hours
    @in_outs.inject(0) { |total, in_out| total + (in_out.hours || 0) }
  end

end
