require 'spec_helper'
describe Punch::InOut do
  describe "validations" do
    context "when is completed" do
      it { Punch::InOut.new(punch_in: Punch.new, punch_out: Punch.new).should be_completed }
    end
    context "when is incompleted" do
      it { Punch::InOut.new(punch_in: Punch.new).should_not be_completed }
      it { Punch::InOut.new(punch_out: Punch.new).should_not be_completed }
      it { Punch::InOut.new({}).should_not be_completed }
    end
  end
end
