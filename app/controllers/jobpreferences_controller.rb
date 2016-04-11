class JobpreferencesController < ApplicationController
  before_action :set_jobpreference, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
	before_action :require_user, except: [:index, :show,]
	before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /jobpreferences
  # GET /jobpreferences.json

 def index
    if current_user.try(:admin?)
       @jobpreferences = Jobpreference.all
      else
         flash[:danger] = "You must be an admin to perform this activity"
         redirect_to root_path
    end

  end
  # GET /jobpreferences/1
  # GET /jobpreferences/1.json
  def show
  end

  # GET /jobpreferences/new
  def new
    if current_user.jobpreference.count < 2
      @jobpreference = Jobpreference.new
    else
     flash[:danger] = "You can add only two Job Preferences"
     redirect_to edit_jobpreference_path(current_user.jobpreference.first)
		 end
  end

  # GET /jobpreferences/1/edit
  def edit
  end

  # POST /jobpreferences
  # POST /jobpreferences.json
  def create
    @jobpreference = Jobpreference.new(jobpreference_params)
    @jobpreference.user = current_user
    respond_to do |format|
      if @jobpreference.save
        format.html { redirect_to root_path, notice: 'Jobpreference was successfully created.' }
        format.json { render :show, status: :created, location: @jobpreference }
      else
        format.html { render :new }
        format.json { render json: @jobpreference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobpreferences/1
  # PATCH/PUT /jobpreferences/1.json
  def update
    respond_to do |format|
      if @jobpreference.update(jobpreference_params)
        format.html { redirect_to root_path, notice: 'Jobpreference was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobpreference }
      else
        format.html { render :edit }
        format.json { render json: @jobpreference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobpreferences/1
  # DELETE /jobpreferences/1.json
  def destroy
    @jobpreference.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Jobpreference was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobpreference
      @jobpreference = Jobpreference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobpreference_params
      params.require(:jobpreference).permit(:jobtitle, :job_title, :job_role, :role_type, :location, :happy_to_relocate, :user_id)
    end
  def  require_same_user
    if current_user != @jobpreference.user
				flash[:danger] ="You can only edit or delete your details"
				redirect_to root_path
			end
	end
end
