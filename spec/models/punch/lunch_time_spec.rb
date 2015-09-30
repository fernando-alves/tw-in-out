require 'spec_helper'

describe Punch::LunchTime do
  context 'creating a lunch time' do
    let(:user) { create(:user) }
    let(:workday) { create(:workday) }

    it 'should create twice punches' do
      lunch_time = Punch::LunchTime.new(user, workday)

      lunch_time.save

      expect(Punch.count).to eq 2
    end

    it 'should create a lunch time in on 12:00 am' do
      lunch_time = Punch::LunchTime.new(user, workday)
      lunch_time.save

      punch = Punch.first

      expect(punch.time.to_date.to_s(:day)).to eq '04/04/2013'
      expect(punch.time.to_s(:time)).to eq '12:00'
    end

    it 'should create a lunch time out on 1:00 pm' do
      lunch_time = Punch::LunchTime.new(user, workday)
      lunch_time.save

      punch = Punch.last

      expect(punch.time.to_date.to_s(:day)).to eq '04/04/2013'
      expect(punch.time.to_s(:time)).to eq '13:00'
    end
  end
end
