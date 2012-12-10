require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :token => "SecretToken"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Name/)
  end
  it "doesn't display the token" do
    render
    rendered.should_not match(/SecretToken/)
  end
end
