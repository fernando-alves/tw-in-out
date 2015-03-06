require 'spec_helper'

describe HomeController, type: :controller do

  context "when then user doesn't logged in" do
    describe "GET 'index'" do
      it "returns bad request" do
        get 'index'

        expect(response).to_not be_success
      end
    end
  end

  context "when the user logged in" do
    before(:each) { sign_in create(:user) }

    describe "GET 'index'" do
      it "returns http success" do
        get 'index'

        expect(response).to be_success
      end
    end
  end

end
