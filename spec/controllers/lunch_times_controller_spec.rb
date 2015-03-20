require 'spec_helper'

describe LunchTimesController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'POST create' do
    subject(:create_lunch_time) { post :create, valid_attributes }

    let(:workday) { create(:workday) }
    let(:lunch_time) { double.as_null_object }
    let(:valid_attributes) do
      { 'workday' => {'id'=> workday.id} }
    end

    before do
      allow(Punch::LunchTime).to receive(:new)
        .with(user, workday)
        .and_return(lunch_time)
    end

    it 'redirects to workdays#show' do
      create_lunch_time

      expect(response).to redirect_to(workday)
    end

    it 'builds a new lunch time with current user' do
      expect(lunch_time).to receive(:save)

      create_lunch_time
    end
  end
end
