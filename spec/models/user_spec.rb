require 'spec_helper'

describe User do
  describe "authentication" do
    context "only ThoughtWorkers can access" do
      it { expect(User.new(email: "xyz@thoughtworks.com")).to be_valid }
      it { expect(User.new(email: "xyz@gmail.com")).to_not be_valid }
    end
  end

  context "when the current user has many punches in different months" do
    let(:user) { create(:user) }
    let(:another_user) { create(:other_user) }

    before do
      create_punch day: "2012-07-30", user: user
      create_punch day: "2013-07-30", user: user
      create_punch day: "2013-06-04", user: user
      create_punch day: "2013-06-08", user: another_user
      create_punch user: user
    end

    it "should return only punches at the month" do
      workdays = user.workdays_at(year: 2013, month: 7)
      first_workday = workdays.first
      punches = first_workday.punches

      first_punch = punches.first

      expect(first_punch.time).to eq "Tue, 30 Jul 2013 10:00:00 BRT -03:00"
    end
    it "should return only punches at the current month" do
      workdays = user.workdays_at(year: nil, month: nil)
      first_workday = workdays.first
      punches = first_workday.punches

      first_punch = punches.first
      day = first_punch.workday.day

      expect(day.strftime("%d/%m/%y")).to eq Time.zone.now.strftime("%d/%m/%y")
    end
  end

  def create_punch(user: user, day: Time.zone.now)
    workday = Workday.create(day: day)
    punch = Punch.new(time: "#{day} 10:00", user_id: user.id, workday_id: workday.id)
    punch.save
  end

end
