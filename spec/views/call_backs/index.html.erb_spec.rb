require 'spec_helper'

describe "call_backs/index" do
  before(:each) do
    assign(:call_backs, [
      stub_model(CallBack,
        :username => "Username",
        :repository => "Repository",
        :url => "Url",
        :payload => "MyText"
      ),
      stub_model(CallBack,
        :username => "Username",
        :repository => "Repository",
        :url => "Url",
        :payload => "MyText"
      )
    ])
  end

  it "renders a list of call_backs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Repository".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
