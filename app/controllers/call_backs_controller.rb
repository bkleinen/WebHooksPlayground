class CallBacksController < ApplicationController




  # POST /call_backs
  # POST /call_backs.json
  def notify
    @call_back = CallBack.new()
    @call_back.username = username = params[:username]
    @call_back.repository = repository =  params[:repository]
    @call_back.payload = params[:payload]
    @call_back.url = authorize_notification(username,repository,request.headers['Authorization'])
   # @call_back = CallBack.new(params) would probably work, too

    respond_to do |format|
      if @call_back.save
        format.html { redirect_to @call_back, notice: 'Call back was successfully created.' }
        format.json { render json: @call_back, status: :created, location: @call_back }
      else
        format.html { render action: "new" }
        format.json { render json: @call_back.errors, status: :unprocessable_entity }
      end
    end
  end
  def authorize_notification(username,repository,sha256)
    user = User.find_by_name(username)
    return "user not found, hash #{sha256}" unless user
    token = user.token
    hash =  Digest::SHA256.hexdigest("#{username}/#{repository}#{token}")
    note = (hash == sha256) ? "AUTHORIZED " : "NOT AUTHORIZED "
    note + sha256
  end


  # GET /call_backs
  # GET /call_backs.json
  def index
    @call_backs = CallBack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @call_backs }
    end
  end

  # GET /call_backs/1
  # GET /call_backs/1.json
  def show
    @call_back = CallBack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call_back }
    end
  end

  # GET /call_backs/new
  # GET /call_backs/new.json
  def new
    @call_back = CallBack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @call_back }
    end
  end

  # GET /call_backs/1/edit
  def edit
    @call_back = CallBack.find(params[:id])
  end

  # POST /call_backs
  # POST /call_backs.json
  def create
    @call_back = CallBack.new(params[:call_back])

    respond_to do |format|
      if @call_back.save
        format.html { redirect_to @call_back, notice: 'Call back was successfully created.' }
        format.json { render json: @call_back, status: :created, location: @call_back }
      else
        format.html { render action: "new" }
        format.json { render json: @call_back.errors, status: :unprocessable_entity }
      end
    end
  end
  




  # PUT /call_backs/1
  # PUT /call_backs/1.json
  def update
    @call_back = CallBack.find(params[:id])

    respond_to do |format|
      if @call_back.update_attributes(params[:call_back])
        format.html { redirect_to @call_back, notice: 'Call back was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @call_back.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /call_backs/1
  # DELETE /call_backs/1.json
  def destroy
    @call_back = CallBack.find(params[:id])
    @call_back.destroy

    respond_to do |format|
      format.html { redirect_to call_backs_url }
      format.json { head :no_content }
    end
  end
end
