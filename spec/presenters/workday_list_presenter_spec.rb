require 'spec_helper'
describe WorkdayListPresenter do
  context "when has a list of empties workdays" do
    presenter = WorkdayListPresenter.new(User.new, [Workday.new])
    workday = presenter.workdays.first
    it { workday.should be_a WorkdayPresenter }
    it { workday.worked_hours.should == "00:00" }
  end

  context "when has a list of workdays with punches" do
    let(:user) { mock_model(User) }
    let(:workday) do
      workday = mock_model(Workday)
      workday.stub(:in_outs_of).with(anything) do
        Punch::InOut.create_for(Given.a_punches_at(
                                "09:00",
                                "12:00",
                                "13:00",
                                "18:00"))
      end
      workday.stub(:worked_hours_of).with(anything) { (Given.an_hour_at "08:00 UTC").to_i }
      workday
    end
    let(:presenter) { WorkdayListPresenter.new(user, [workday, workday]) }
    it "should calculate how many hours was worked for a single workday" do
      first_workday = presenter.workdays.first
      first_workday.worked_hours.should == "08:00"
    end
    it "should calculate how many hours was worked in general" do
      presenter.worked_hours.should == "16:00"
    end
  end

end
