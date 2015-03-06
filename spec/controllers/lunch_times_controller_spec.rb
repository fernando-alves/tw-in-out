require 'spec_helper'

describe LunchTimesController, type: :controller do
  let(:user) { create(:user) }
  let(:workday) { create(:workday) }

  def valid_attributes
    { "workday" => {"id"=> workday.id} }
  end
  describe "POST create" do
    before(:each) { sign_in user }

    describe "with valid params" do
      it "should redirect to workdays#show" do
        post :create, valid_attributes

        expect(response).to redirect_to(workday)
      end
      it "should built a new lunch time with current user" do
        expect(Punch::LunchTime).to receive(:new).with(user, workday) { double(save: true) }

        post :create, valid_attributes
      end
    end
  end
end
