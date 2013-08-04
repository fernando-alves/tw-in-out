require 'spec_helper'

describe User do
  describe "authentication" do
    context "only ThoughtWorkers can access" do
      it { User.new(email: "xyz@thoughtworks.com").should be_valid }
      it { User.new(email: "xyz@gmail.com").should_not be_valid }
    end
  end

  context "when the current user has many punches in different months" do
    let(:user) { create(:user) }
    let(:punch_on_june) { build(:punch_on_june) }
    let(:punch_on_july) { build(:punch_on_july) }
    let(:punch_on_july_last_year) { build(:punch_on_july) }

    let(:another_user) { create(:other_user) }
    let(:another_punch_on_june) { build(:another_punch_on_june) }

    before do
      punch_on_july_last_year.user = user
      punch_on_july_last_year.workday = Workday.create(day: "2012-07-30")
      punch_on_july_last_year.save

      punch_on_july.user = user
      punch_on_july.workday = Workday.create(day: "2013-07-30")
      punch_on_july.save

      punch_on_june.user = user
      punch_on_june.workday = Workday.create(day: "2013-06-04")
      punch_on_june.save

      another_punch_on_june.user = another_user
      another_punch_on_june.workday = Workday.create(day: "2013-06-08")
      another_punch_on_june.save
    end

    it "should return only punches at the month" do
      workdays = user.workdays_at(year: 2013, month: 7)
      punches = workdays.first.punches

      punches.first.should == punch_on_july
    end
  end
end
