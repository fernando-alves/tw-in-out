class Workday::Counter
  include ActiveModel::Validations

  validates :in_outs, :presence => true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def hours
    in_outs.inject(0) { |total, in_out| total + in_out.hours }
  end

  private
  attr_accessor :in_outs
end
