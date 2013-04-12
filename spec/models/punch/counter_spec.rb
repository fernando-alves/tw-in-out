require 'spec_helper'
describe Punch::Counter do
  describe "when punches are valids" do
    context "calculating how many hours is spent on the morning" do
     #in_out = Given.an_in_out.at today.at "09:00", today.at "12:00"

     #in_outs


     #1
     #in_outs = [in_out1, in_out2]
     #count in_outs

    #2 first class collection
    #in_outs = InOuts.new in_out1, in_out2
    #in_outs.count

     #in_out.count


      #xxx = Given.a_punch_count_with(
                 #a_morning_punch = Given.a_punch.at "2013-1-1 09:00",
                 #a_before_lunch_punch = Given.a_punch_at "2013-1-1 12:00")

      #xxx.count.should == "03:00"

      let(:morning_in) { Punch.new time: Time.zone.parse("2013-1-1 09:00") }
      let(:morning_out) { Punch.new time: Time.zone.parse("2013-1-1 12:00") }
      subject { Punch::Counter.new [morning_in, morning_out] }
      it { subject.count.should == "03:00" }
    end

    context "calculating how many hours usually is spent" do
      let(:morning_in) { Punch.new time: Time.zone.parse("2013-1-1 09:45") }
      let(:morning_out) { Punch.new time: Time.zone.parse("2013-1-1 12:00") }
      let(:afternoon_in) { Punch.new time: Time.zone.parse("2013-1-1 13:00") }
      let(:afternoon_out) { Punch.new time: Time.zone.parse("2013-1-1 19:10") }
      subject { Punch::Counter.new [morning_in, morning_out, afternoon_in, afternoon_out] }
      it { subject.count.should == "08:25" }
    end

    context "calculating how many hours was spet in different times" do
      let(:morning_in) { Punch.new time: Time.zone.parse("2013-1-1 09:00") }
      let(:morning_out) { Punch.new time: Time.zone.parse("2013-1-1 12:00") }
      let(:afternoon_in) { Punch.new time: Time.zone.parse("2013-1-1 13:00") }
      let(:snack_out) { Punch.new time: Time.zone.parse("2013-1-1 15:00") }
      let(:snack_in) { Punch.new time: Time.zone.parse("2013-1-1 16:00") }
      let(:afternoon_out) { Punch.new time: Time.zone.parse("2013-1-1 19:00") }
      subject { Punch::Counter.new [morning_in, morning_out, snack_in, snack_out, afternoon_in, afternoon_out] }
      it { subject.count.should == "08:00" }
    end

    context "when has two workdays" do
      let(:first_morning_in) { Punch.new time: Time.zone.parse("2013-1-1 09:30") }
      let(:first_morning_out) { Punch.new time: Time.zone.parse("2013-1-1 12:00") }
      let(:first_afternoon_in) { Punch.new time: Time.zone.parse("2013-1-1 13:00") }
      let(:first_afternoon_out) { Punch.new time: Time.zone.parse("2013-1-1 19:00") }
      let(:second_morning_in) { Punch.new time: Time.zone.parse("2013-1-2 09:00") }
      let(:second_morning_out) { Punch.new time: Time.zone.parse("2013-1-2 12:00") }
      let(:second_afternoon_in) { Punch.new time: Time.zone.parse("2013-1-2 13:00") }
      let(:second_afternoon_out) { Punch.new time: Time.zone.parse("2013-1-2 18:00") }
      subject { Punch::Counter.new [first_morning_in, first_morning_out, first_afternoon_in, first_afternoon_out, second_morning_in, second_morning_out, second_afternoon_in, second_afternoon_out] }
      it { subject.count.should == "16:30" }
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
