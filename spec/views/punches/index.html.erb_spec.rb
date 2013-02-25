require 'spec_helper'

describe "punches/index" do
  before(:each) do
    assign(:punches, [
      stub_model(Punch,
        :user => nil,
        :type => "Type"
      ),
      stub_model(Punch,
        :user => nil,
        :type => "Type"
      )
    ])
  end

  xit "renders a list of punches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
