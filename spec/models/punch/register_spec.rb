require 'spec_helper'

describe Punch::Register do
  describe ".punch" do
    subject(:register_punch) { Punch::Register.punch(user, attributes) }

    let(:user) { create(:user) }
    let(:attributes) do
      {
        "time(1i)"=>"2013",
        "time(2i)"=>"4",
        "time(3i)"=>"4",
        "time(4i)"=>"14",
        "time(5i)"=>"41"
      }
    end

    it { expect(register_punch).to be_valid }
    it { expect(register_punch.workday).to be_persisted }

    context "when workday already exist" do
      before {Workday.create(day: "2013-04-04") }

      it "keeps workday count" do
        3.times { register_punch }

        expect(Workday.count).to eq 1
      end
    end
  end
end
