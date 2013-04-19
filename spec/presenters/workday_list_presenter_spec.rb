require 'spec_helper'
describe WorkdayListPresenter do
  context "when has a list of empties workdays" do
    presenter = WorkdayListPresenter.new(User.new, [Workday.new])
    workday = presenter.workdays.first
    it { workday.should be_a WorkdayPresenter }
    it { workday.worked_hours.should == 0 }
  end

  context "when has a list of workdays with punches" do
    let(:user) { mock_model(User) }
    let(:workday) do
      workday = mock_model(Workday)
      workday.stub(:worked_hours_of).with(anything) { 8.8 * 3600 }
      workday
    end
    let(:workdays) do
      workdays = []
      5.times { workdays << workday }
      workdays
    end
    let(:presenter) { WorkdayListPresenter.new(user, workdays) }

    it { presenter.should have(5).workdays }
    it "should calculate how many hours was worked for a single workday" do
      first_workday = presenter.workdays.first
      first_workday.worked_hours.should == 8.8
    end
    it "should calculate how many hours was worked in general" do
      presenter.worked_hours.should == 44.0
    end
  end

end
