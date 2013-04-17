require 'spec_helper'
describe WorkdayPresenter do

  describe "getting in outs" do
    punches = Given.a_punches_at "09:00", "12:00", "13:00", "18:00"
    presenter = WorkdayPresenter.new(Workday.new, punches)
    it { presenter.should have(2).in_outs_presenters }
    it { presenter.in_outs_presenters[0].in.should == "09:00" }
    it { presenter.in_outs_presenters[0].out.should == "12:00" }
    it { presenter.in_outs_presenters[1].in.should == "13:00" }
    it { presenter.in_outs_presenters[1].out.should == "18:00" }
    it { presenter.worked_hours.should == "08:00" }
  end

end
