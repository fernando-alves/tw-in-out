require 'spec_helper'

describe Punch::Register do

  describe "registering punch" do

    let(:user) { create(:user) }
    let(:params) do
      { "time(1i)"=>"2013",
        "time(2i)"=>"4",
        "time(3i)"=>"4",
        "time(4i)"=>"14",
        "time(5i)"=>"41"
      }
    end

    it { expect(Punch::Register.punch(user, params)).to be_valid }

    context "when workday doesn't exist yet" do
      it "should create a new workday" do
        punch = Punch::Register.punch(user, params)

        expect(punch.workday).to be_persisted
      end
    end

    context "when workday already exist" do
      before {Workday.create(day: "2013-04-04") }
      it "should use current workday" do
        punch = Punch::Register.punch(user, params)

        expect(Workday.count).to eq 1
      end
    end


  end
end
