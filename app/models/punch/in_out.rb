class Punch::InOut

  def initialize(params)
    @punch_in, @punch_out = params[:punch_in], params[:punch_out]
  end

  def hours
    completed? ? (@punch_out.time.to_i - @punch_in.time.to_i) : nil
  end

  def completed?
    @punch_in && @punch_out
  end

end
