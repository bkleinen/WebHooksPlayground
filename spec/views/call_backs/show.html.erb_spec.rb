require 'spec_helper'

describe "call_backs/show" do
  before(:each) do
    @call_back = assign(:call_back, stub_model(CallBack,
      :username => "Username",
      :repository => "Repository",
      :url => "Url",
      :payload => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Username/)
    rendered.should match(/Repository/)
    rendered.should match(/Url/)
    rendered.should match(/MyText/)
  end
end
