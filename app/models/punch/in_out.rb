class Punch::InOut
  include ActiveModel::Validations

  validates :punch_in, :punch_out, :presence => true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def hours
    punch_out.time.to_i - punch_in.time.to_i
  end

  private
  attr_accessor :punch_in, :punch_out

end
