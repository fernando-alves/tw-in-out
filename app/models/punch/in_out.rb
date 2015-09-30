class Punch::InOut
  attr_reader :punch_in, :punch_out

  def initialize(params)
    @punch_in = params[:punch_in]
    @punch_out = params[:punch_out]
  end

  def self.create_for(punches)
    in_outs = []
    punches.each_slice(SLICE) do |p|
      in_outs << Punch::InOut.new(punch_in: p[FIRST], punch_out: p[SECOND])
    end
    in_outs
  end

  def hours
    completed? ? (punch_out.time.to_f - punch_in.time.to_f) : nil
  end

  def completed?
    punch_in && punch_out
  end

  private

  SLICE = 2
  FIRST = 0
  SECOND = 1
end
