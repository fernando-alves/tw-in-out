require 'spec_helper'

describe ParamsToDate do
  let(:subject) { ParamsToDate.new('2013-8') }

  it { expect(subject.year).to eq '2013' }
  it { expect(subject.month).to eq '08' }
  it { expect(subject.date).to eq '2013-08' }

  context 'when date is invalid' do
    current_time = Time.zone.now
    year = current_time.year
    month = (current_time.month).to_s.rjust(2, '0')

    params_to_date = ParamsToDate.new('  ')
    it { params_to_date.date == "#{year}-#{month}" }
  end
end
