require 'spec_helper'
describe WorkdayCounterPresenter do
  context "given the number of worked hours" do
    workday_counter_presenter = WorkdayCounterPresenter.new(User.new, [Workday.new])
    workday = workday_counter_presenter.workdays.first
    it { workday.should be_a WorkdayPresenter }
    xit { workday.hours.should == "00:00" }
  end
end
