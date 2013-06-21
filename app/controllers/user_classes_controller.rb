class UserClassesController < ApplicationController
  # GET /user_classes
  # GET /user_classes.json
  def index
    @user_classes = UserClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_classes }
    end
  end

  # GET /user_classes/1
  # GET /user_classes/1.json
  def show
    @user_class = UserClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_class }
    end
  end

  # GET /user_classes/new
  # GET /user_classes/new.json
  def new
    @user_class = UserClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_class }
    end
  end

  # GET /user_classes/1/edit
  def edit
    @user_class = UserClass.find(params[:id])
  end

  # POST /user_classes
  # POST /user_classes.json
  def create
    @user_class = UserClass.new(params[:user_class])

    respond_to do |format|
      if @user_class.save
        format.html { redirect_to @user_class, notice: 'User class was successfully created.' }
        format.json { render json: @user_class, status: :created, location: @user_class }
      else
        format.html { render action: "new" }
        format.json { render json: @user_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_classes/1
  # PUT /user_classes/1.json
  def update
    @user_class = UserClass.find(params[:id])

    respond_to do |format|
      if @user_class.update_attributes(params[:user_class])
        format.html { redirect_to @user_class, notice: 'User class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_classes/1
  # DELETE /user_classes/1.json
  def destroy
    @user_class = UserClass.find(params[:id])
    @user_class.destroy

    respond_to do |format|
      format.html { redirect_to user_classes_url }
      format.json { head :no_content }
    end
  end

  def has_password?(password)

  end
  
  def authenticate(username, password)
    user = find_by_username(username)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
    return nil
  end
end
