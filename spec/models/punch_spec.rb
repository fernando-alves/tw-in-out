require 'spec_helper'

describe Punch do
  describe "validations" do
    it { should validate_presence_of :user }
    it { should validate_presence_of :kind }
    it { should validate_presence_of :time }
  end

  describe "build with" do
    it "should create punch with valid parameters" do
      user = User.new(id: 1)
      params = {"time" => "2013-01-01 09:00:00", "kind" => "IN"}
      Punch.build_with(user, params).should_not be_nil
    end
  end
end
