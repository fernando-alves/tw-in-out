require 'spec_helper'
describe Punch::Counter do
  describe "when punches are valids" do
    context "calculating how many hours is spent on the morning" do
      punch_counter = Given.a_punch_counter(
                            Given.a_punch(at: "09:00"),
                            Given.a_punch(at: "12:00"))
      it { punch_counter.count.should == "03:00" }
    end

    context "calculating how many hours usually is spent" do
      punch_counter = Given.a_punch_counter(
                            Given.a_punch(at: "09:45"),
                            Given.a_punch(at: "12:00"),
                            Given.a_punch(at: "13:00"),
                            Given.a_punch(at: "19:10"))
      it { punch_counter.count.should == "08:25" }
    end

    context "calculating how many hours was spet in different times" do
      punch_counter = Given.a_punch_counter(
                            Given.a_punch(at: "09:00"),
                            Given.a_punch(at: "12:00"),
                            Given.a_punch(at: "13:00"),
                            Given.a_punch(at: "15:00"),
                            Given.a_punch(at: "16:00"),
                            Given.a_punch(at: "19:30"))
      it { punch_counter.count.should == "08:30" }
    end

    context "when has two workdays" do
      punch_counter = Given.a_punch_counter(
                            Given.a_punch(on: 1,at: "09:30"),
                            Given.a_punch(on: 1, at: "12:00"),
                            Given.a_punch(on: 1, at: "13:00"),
                            Given.a_punch(on: 1, at: "19:00"),
                            Given.a_punch(on: 2, at: "09:00"),
                            Given.a_punch(on: 2, at: "12:30"),
                            Given.a_punch(on: 2, at: "13:30"),
                            Given.a_punch(on: 2, at: "18:00"))
      it { punch_counter.count.should == "16:30" }
    end
  end

  describe "when punches aren't valids" do
    context "when punches is nil" do
      subject { Punch::Counter.new nil }
      it { subject.count.should == "00:00" }
    end

    context "when punches is empty" do
      subject { Punch::Counter.new [] }
      it { subject.count.should == "00:00" }
    end

    context "when only has one punch" do
      let(:morning_in) { Punch.new time: Time.zone.parse("2013-1-1 09:00") }
      subject { Punch::Counter.new [morning_in] }
      it { subject.count.should == "00:00" }
    end
    context "when has odd punches" do
      let(:morning_in) { Punch.new time: Time.zone.parse("2013-1-1 09:00") }
      let(:morning_out) { Punch.new time: Time.zone.parse("2013-1-1 12:00") }
      let(:afternoon_in) { Punch.new time: Time.zone.parse("2013-1-1 13:00") }
      subject { Punch::Counter.new [morning_in, morning_out, afternoon_in] }
      it { subject.count.should == "00:00" }
    end
  end

end
