require 'spec_helper'
describe Punch::InOut do
  describe "validations" do
    subject { Punch::InOut.new(punch_in: Punch.new, punch_out: Punch.new) }
    it { should validate_presence_of :punch_in }
    it { should validate_presence_of :punch_out }
  end
end
