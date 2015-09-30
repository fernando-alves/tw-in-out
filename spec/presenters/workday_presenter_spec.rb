require 'spec_helper'
describe WorkdayPresenter do
  describe 'getting in outs' do
    let(:presenter) do
      user = double(User)
      workday = double(Workday)

      allow(workday).to receive(:in_outs_of).with(anything) do
        Punch::InOut.create_for(Given.a_punches_at(
                                  '09:00',
                                  '12:00',
                                  '13:00',
                                  '18:00'))
      end
      allow(workday).to receive(:worked_hours_of).with(anything) { 8 * 3600 }

      WorkdayPresenter.new(user, workday)
    end

    it { expect(presenter).to have(2).in_outs_presenters }
    it { expect(presenter.in_outs_presenters[0].in).to eq '09:00' }
    it { expect(presenter.in_outs_presenters[0].out).to eq '12:00' }
    it { expect(presenter.in_outs_presenters[1].in).to eq '13:00' }
    it { expect(presenter.in_outs_presenters[1].out).to eq '18:00' }
    it { expect(presenter.worked_hours).to eq 8.0 }
  end
end
