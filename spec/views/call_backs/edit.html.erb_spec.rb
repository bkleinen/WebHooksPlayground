require 'spec_helper'

describe "call_backs/edit" do
  before(:each) do
    @call_back = assign(:call_back, stub_model(CallBack,
      :username => "MyString",
      :repository => "MyString",
      :url => "MyString",
      :payload => "MyText"
    ))
  end

  it "renders the edit call_back form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => call_backs_path(@call_back), :method => "post" do
      assert_select "input#call_back_username", :name => "call_back[username]"
      assert_select "input#call_back_repository", :name => "call_back[repository]"
      assert_select "input#call_back_url", :name => "call_back[url]"
      assert_select "textarea#call_back_payload", :name => "call_back[payload]"
    end
  end
end
