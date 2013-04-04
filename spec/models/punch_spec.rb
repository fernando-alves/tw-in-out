require 'spec_helper'

describe Punch do
  describe "validations" do
    it { should validate_presence_of :user }
    it { should validate_presence_of :kind }
    it { should validate_presence_of :time }
    it { should validate_presence_of :workday }
  end

  describe "querying" do
    it "should retrieve all punches by user" do
      punch = create(:punch)
      user = punch.user
      Punch.all_by(user).should == [punch]
    end
  end
end
