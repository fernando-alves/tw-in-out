require 'spec_helper'

describe ParamsToDate do

  let(:subject) { ParamsToDate.new("2013-8") }

  it { subject.year.should == "2013" }
  it { subject.month.should == "08" }
  it { subject.date.should == "2013-08" }

  context "when date is invalid" do
    current_time = Time.zone.now
    year, month = current_time.year, (current_time.month).to_s.rjust(2, '0')

    params_to_date = ParamsToDate.new('  ')
    it { params_to_date.date == "#{year}-#{month}" }
  end

end
