require 'spec_helper'

describe HomeController do

  context "when then user doesn't logged in" do
    describe "GET 'index'" do
      xit "returns bad request" do
        get 'index'
        response.should_not be_success
      end
    end
  end

  context "when the user logged in" do
    login
    describe "GET 'index'" do
      xit "returns http success" do
        get 'index'
        response.should be_success
      end
    end
  end

end
