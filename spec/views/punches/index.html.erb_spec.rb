require 'spec_helper'

describe "punches/index" do
  before(:each) do
    assign(:punches, [
      stub_model(Punch,
        :user => nil,
        :kind => "IN"
      ),
      stub_model(Punch,
        :user => nil,
        :kind => "OUT"
      )
    ])
  end

  xit "renders a list of punches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Kind".to_s, :count => 2
  end
end
