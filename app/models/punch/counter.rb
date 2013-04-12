class Punch::Counter
  def initialize(punches)
    @punches = punches
  end

  def count
    return "00:00" if invalid_punches?
    if @punches.size == MINIMUM_SIZE
      total = difference_between(@punches.last, @punches.first)
    else
      differences = []
      @punches.reverse.each_slice(SLICE) do |p|
        differences << p.inject do |result, element|
          difference_between(result, element)
        end
      end
      total = differences.inject(:+)
    end
    Time.at(total).utc.strftime("%H:%M")
  end

  private
  MINIMUM_SIZE = 2
  SLICE = 2

  def difference_between(first, second)
    first.time.to_i - second.time.to_i
  end

  def invalid_punches?
    @punches.nil? || @punches.empty? || @punches.size % 2 != 0
  end
end
