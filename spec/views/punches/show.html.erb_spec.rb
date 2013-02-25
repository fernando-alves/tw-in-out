require 'spec_helper'

describe "punches/show" do
  before(:each) do
    @punch = assign(:punch, stub_model(Punch,
      :user => nil,
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Type/)
  end
end
