require 'spec_helper'
describe WorkdayPresenter do

  describe "getting in outs" do
    let(:presenter) do
      user = mock_model(User)
      workday = mock_model(Workday)
      workday.stub(:in_outs_of).with(anything) do
        Punch::InOut.create_for(Given.a_punches_at(
                                "09:00",
                                "12:00",
                                "13:00",
                                "18:00"))
      end
      workday.stub(:worked_hours_of).with(anything) { 8 * 3600 }
      WorkdayPresenter.new(user, workday)
    end

    it { presenter.should have(2).in_outs_presenters }
    it { presenter.in_outs_presenters[0].in.should == "09:00" }
    it { presenter.in_outs_presenters[0].out.should == "12:00" }
    it { presenter.in_outs_presenters[1].in.should == "13:00" }
    it { presenter.in_outs_presenters[1].out.should == "18:00" }
    it { presenter.worked_hours.should == 8.0 }
  end

end
