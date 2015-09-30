module Hour::Countable
  def hours_of(records)
    records.inject(0) { |total, obj| total + (obj.hours || 0) }
  end
end
