require 'spec_helper'

describe Workday do
  describe "validations" do
    it { should validate_presence_of :day }
    it { should have_many :punches }
  end
end
