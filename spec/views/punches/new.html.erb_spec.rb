require 'spec_helper'

describe "punches/new" do
  before(:each) do
    assign(:punch, stub_model(Punch,
      :user => nil,
      :type => ""
    ).as_new_record)
  end

  it "renders new punch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => punches_path, :method => "post" do
      assert_select "input#punch_user", :name => "punch[user]"
      assert_select "input#punch_type", :name => "punch[type]"
    end
  end
end
