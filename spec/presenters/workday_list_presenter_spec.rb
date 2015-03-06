require 'spec_helper'
describe WorkdayListPresenter do
  context "when has a list of empties workdays" do
    presenter = WorkdayListPresenter.new(User.new, [Workday.new])
    workday = presenter.workdays.first

    it { expect(workday).to be_a WorkdayPresenter }
    it { expect(workday.worked_hours).to eq 0 }
  end

  context "when has a list of workdays with punches" do
    let(:user) { double(User) }
    let(:workday) do
      workday = double(Workday)
      allow(workday).to receive(:worked_hours_of).with(anything) { 8.8 * 3600 }
      workday
    end
    let(:workdays) do
      workdays = []
      5.times { workdays << workday }
      workdays
    end

    let(:presenter) { WorkdayListPresenter.new(user, workdays) }

    it { expect(presenter).to have(5).workdays }
    it "should calculate how many hours was worked for a single workday" do
      first_workday = presenter.workdays.first

      expect(first_workday.worked_hours).to eq 8.8
    end
    it "should calculate how many hours was worked in general" do
      expect(presenter.worked_hours).to eq 44.0
    end
  end

end
