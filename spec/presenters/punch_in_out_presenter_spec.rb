require 'spec_helper'
describe PunchInOutPresenter do
  context 'time formating' do
    context 'when in out is completed' do
      in_out = Given.a_in_out_presenter_with punch_in: '09:00', punch_out: '12:30'

      it { expect(in_out.hours).to eq 3.5 }
      it { expect(in_out.in).to eq '09:00' }
      it { expect(in_out.out).to eq '12:30'  }
    end
    context 'when in out is not completed' do
      in_out = Given.a_in_out_presenter_with punch_in: '09:00'

      it { expect(in_out.hours).to eq 0.0 }
      it { expect(in_out.in).to eq '09:00' }
      it { expect(in_out.out).to eq '' }
    end
  end
end
