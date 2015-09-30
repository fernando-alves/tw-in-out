require 'spec_helper'

describe Punch do
  describe 'validations' do
    it { should validate_presence_of :user }
    it { should validate_presence_of :time }
    it { should validate_presence_of :workday }
  end

  describe 'querying' do
    it 'should retrieve all punches by user and workday' do
      punch = create(:punch)
      workday = punch.workday
      user = punch.user
      expect(Punch.all_by(user: user, workday: workday)).to eq [punch]
    end
  end
end
