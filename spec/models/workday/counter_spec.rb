require 'spec_helper'
describe Workday::Counter do

  def t(hours)
    TimeFormatter.format hours
  end

  describe "when punches are valids" do
    context "calculating how many hours is spent on the morning" do
      in_out = Given.a_in_out(punch_in: "09:00", punch_out: "12:00")
      it { t(in_out.hours).should == "03:00" }
    end

    context "calculating how many hours usually is spent" do
      workday_counter = Given.a_workday_counter(
                            Given.a_in_out(punch_in: "09:45", punch_out: "12:00"),
                            Given.a_in_out(punch_in: "13:00", punch_out: "19:10"))
      it { t(workday_counter.hours).should == "08:25" }
    end

    context "calculating how many hours was spet in different times" do
      workday_counter = Given.a_workday_counter(
                            Given.a_in_out(punch_in: "09:00", punch_out: "12:00"),
                            Given.a_in_out(punch_in: "13:00", punch_out: "15:00"),
                            Given.a_in_out(punch_in: "16:00", punch_out: "19:30"))
      it { t(workday_counter.hours).should == "08:30" }
    end

    context "when has two workdays" do
      workday_counter = Given.a_workday_counter(
                            Given.a_in_out(at_day: 1, punch_in: "09:30", punch_out: "12:00"),
                            Given.a_in_out(at_day: 1, punch_in: "13:00", punch_out: "19:00"),
                            Given.a_in_out(at_day: 2, punch_in: "09:00", punch_out: "12:30"),
                            Given.a_in_out(at_day: 2, punch_in: "13:30", punch_out: "18:00"))
      it { t(workday_counter.hours).should == "16:30" }
    end
  end

  describe "when punches aren't valids" do
    context "when only has one punch" do
      workday_counter = Given.a_workday_counter Given.a_in_out(punch_in: "09:00")
      it { t(workday_counter.hours).should == "00:00" }
    end
    context "when has odd punches" do
      workday_counter = Given.a_workday_counter(
                            Given.a_in_out(punch_in: "09:00", punch_out: "12:00"),
                            Given.a_in_out(punch_in: "13:00"))
      it { t(workday_counter.hours).should == "03:00" }
    end
  end

end
