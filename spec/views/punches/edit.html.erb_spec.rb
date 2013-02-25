require 'spec_helper'

describe "punches/edit" do
  before(:each) do
    @punch = assign(:punch, stub_model(Punch,
      :user => nil,
      :type => ""
    ))
  end

  it "renders the edit punch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => punches_path(@punch), :method => "post" do
      assert_select "input#punch_user", :name => "punch[user]"
      assert_select "input#punch_type", :name => "punch[type]"
    end
  end
end
