require 'spec_helper'
describe WorkdayListPresenter do
  context "given the number of worked hours" do
    workday_counter_presenter = WorkdayListPresenter.new(User.new, [Workday.new])
    workday = workday_counter_presenter.workdays.first
    it { workday.should be_a WorkdayPresenter }
    it { workday.worked_hours.should == "00:00" }
  end
end
