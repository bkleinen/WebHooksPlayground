require 'spec_helper'




describe CallBacksController do
  # This should return the minimal set of attributes required to create a valid
  # CallBack. As you add validations to CallBack, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "username" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CallBacksController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  def notify_params
    { username: "drblinken", repository: "VisualStats"}
  end
  describe "notify" do
      describe "POST notify" do
         describe "with valid params" do
           it "creates a new CallBack" do
             expect {
               post :notify, notify_params, valid_session
             }.to change(CallBack, :count).by(1)
           end
     
           it "assigns a newly created call_back as @call_back" do
             post :notify, notify_params, valid_session
             assigns(:call_back).should be_a(CallBack)
             assigns(:call_back).should be_persisted
           end
     
           it "redirects to the created call_back" do
             post :notify, notify_params, valid_session
             response.should redirect_to(CallBack.last)
           end
         end
     
#         describe "with invalid params" do
#           it "assigns a newly created but unsaved call_back as @call_back" do
#             # Trigger the behavior that occurs when invalid params are submitted
#             CallBack.any_instance.stub(:save).and_return(false)
#             post :create, {:call_back => { "username" => "invalid value" }}, valid_session
#             assigns(:call_back).should be_a_new(CallBack)
#           end
#     
#           it "re-renders the 'new' template" do
#             # Trigger the behavior that occurs when invalid params are submitted
#             CallBack.any_instance.stub(:save).and_return(false)
#             post :create, {:call_back => { "username" => "invalid value" }}, valid_session
#             response.should render_template("new")
#           end
#         end
       end

  end





  


  # these are the generated / scaffold specs
  describe "GET index" do
    it "assigns all call_backs as @call_backs" do
      call_back = CallBack.create! valid_attributes
      get :index, {}, valid_session
      assigns(:call_backs).should eq([call_back])
    end
  end

  describe "GET show" do
    it "assigns the requested call_back as @call_back" do
      call_back = CallBack.create! valid_attributes
      get :show, {:id => call_back.to_param}, valid_session
      assigns(:call_back).should eq(call_back)
    end
  end

  describe "GET new" do
    it "assigns a new call_back as @call_back" do
      get :new, {}, valid_session
      assigns(:call_back).should be_a_new(CallBack)
    end
  end

  describe "GET edit" do
    it "assigns the requested call_back as @call_back" do
      call_back = CallBack.create! valid_attributes
      get :edit, {:id => call_back.to_param}, valid_session
      assigns(:call_back).should eq(call_back)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CallBack" do
        expect {
          post :create, {:call_back => valid_attributes}, valid_session
        }.to change(CallBack, :count).by(1)
      end

      it "assigns a newly created call_back as @call_back" do
        post :create, {:call_back => valid_attributes}, valid_session
        assigns(:call_back).should be_a(CallBack)
        assigns(:call_back).should be_persisted
      end

      it "redirects to the created call_back" do
        post :create, {:call_back => valid_attributes}, valid_session
        response.should redirect_to(CallBack.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved call_back as @call_back" do
        # Trigger the behavior that occurs when invalid params are submitted
        CallBack.any_instance.stub(:save).and_return(false)
        post :create, {:call_back => { "username" => "invalid value" }}, valid_session
        assigns(:call_back).should be_a_new(CallBack)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CallBack.any_instance.stub(:save).and_return(false)
        post :create, {:call_back => { "username" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested call_back" do
        call_back = CallBack.create! valid_attributes
        # Assuming there are no other call_backs in the database, this
        # specifies that the CallBack created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CallBack.any_instance.should_receive(:update_attributes).with({ "username" => "MyString" })
        put :update, {:id => call_back.to_param, :call_back => { "username" => "MyString" }}, valid_session
      end

      it "assigns the requested call_back as @call_back" do
        call_back = CallBack.create! valid_attributes
        put :update, {:id => call_back.to_param, :call_back => valid_attributes}, valid_session
        assigns(:call_back).should eq(call_back)
      end

      it "redirects to the call_back" do
        call_back = CallBack.create! valid_attributes
        put :update, {:id => call_back.to_param, :call_back => valid_attributes}, valid_session
        response.should redirect_to(call_back)
      end
    end

    describe "with invalid params" do
      it "assigns the call_back as @call_back" do
        call_back = CallBack.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CallBack.any_instance.stub(:save).and_return(false)
        put :update, {:id => call_back.to_param, :call_back => { "username" => "invalid value" }}, valid_session
        assigns(:call_back).should eq(call_back)
      end

      it "re-renders the 'edit' template" do
        call_back = CallBack.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CallBack.any_instance.stub(:save).and_return(false)
        put :update, {:id => call_back.to_param, :call_back => { "username" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested call_back" do
      call_back = CallBack.create! valid_attributes
      expect {
        delete :destroy, {:id => call_back.to_param}, valid_session
      }.to change(CallBack, :count).by(-1)
    end

    it "redirects to the call_backs list" do
      call_back = CallBack.create! valid_attributes
      delete :destroy, {:id => call_back.to_param}, valid_session
      response.should redirect_to(call_backs_url)
    end
  end

end
