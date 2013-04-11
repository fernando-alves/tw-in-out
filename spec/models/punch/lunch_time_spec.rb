require 'spec_helper'

describe Punch::LunchTime do
  context "creating a lunch time" do
    let(:user) { create(:user) }
    let(:workday) { create(:workday) }
    it "should create twice punches" do
      lunch_time = Punch::LunchTime.new(user, workday)
      lunch_time.save
      Punch.count.should == 2
    end
    it "should create a lunch time in on 12:00 am" do
      lunch_time = Punch::LunchTime.new(user, workday)
      lunch_time.save
      punch = Punch.first
      punch.time.to_date.to_s(:day).should == "04/04/2013"
      punch.time.to_s(:time).should == "12:00"
      punch.kind.should == Punch::OUT
    end
    it "should create a lunch time out on 1:00 pm" do
      lunch_time = Punch::LunchTime.new(user, workday)
      lunch_time.save
      punch = Punch.last
      punch.time.to_date.to_s(:day).should == "04/04/2013"
      punch.time.to_s(:time).should == "13:00"
      punch.kind.should == Punch::IN
    end

  end
end
