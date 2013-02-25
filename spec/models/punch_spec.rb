require 'spec_helper'

describe Punch do
  describe "validations" do
    it { should validate_presence_of :user }
  end
end
