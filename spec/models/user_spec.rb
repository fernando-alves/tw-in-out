require 'spec_helper'

describe User do
  describe "authentication" do
    context "only ThoughtWorkers can access" do
      it { User.new(email: "xyz@thoughtworks.com").should be_valid }
      it { User.new(email: "xyz@gmail.com").should_not be_valid }
    end
  end
end
