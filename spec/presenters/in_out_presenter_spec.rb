require 'spec_helper'
describe InOutPresenter do
  context "time formating" do
    context "when in out is completed" do
      in_out = Given.a_in_out_presenter_with punch_in: "09:00", punch_out: "12:00"
      it { in_out.hours.should == "03:00"  }
      it { in_out.in.should == "09:00"  }
      it { in_out.out.should == "12:00"  }
    end
    context "when in out is not completed" do
      in_out = Given.a_in_out_presenter_with punch_in: "09:00"
      it { in_out.hours.should == "00:00"  }
      it { in_out.in.should == "09:00"  }
      it { in_out.out.should == ""  }
    end
  end
end
