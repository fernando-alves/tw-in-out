require 'spec_helper'
describe WorkdayPresenter do

  describe "getting in outs" do
    let(:workday) { mock_model(Workday) }
    let(:punches) do
      punches = []
      4.times do
        punches << mock_model(Punch)
      end
      punches
    end
    it { WorkdayPresenter.new(workday, punches).should have(2).in_outs }
  end

end
