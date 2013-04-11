require 'spec_helper'

describe LunchTimesController do
  login
  let(:lunch_time) { mock(Punch::LunchTime) }
  let(:workday) { create(:workday) }

  def valid_attributes
    { "workday" => {"id"=> workday.id} }
  end
  describe "POST create" do
    describe "with valid params" do
      it "should redirect to workdays#show" do
        post :create, valid_attributes
        response.should redirect_to(workday)
      end
      it "should built a new lunch time with current user" do
        Punch::LunchTime.stub(:new).with(anything) { lunch_time }
        lunch_time.stub(:save) { true }
        Punch::LunchTime.should_receive(:new).with(@current_user, workday)
        post :create, valid_attributes
      end
    end
  end
end
