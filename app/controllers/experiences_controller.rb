class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
	skip_before_action :authenticate_user!, only: [:index]
	before_action :require_user, except: [:index, :show,]
	before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /experiences
  # GET /experiences.json

 def index
    if current_user.try(:admin?)
       @experiences = Experience.all
      else
         flash[:danger] = "You must be an admin to perform this activity"
         redirect_to root_path
    end
  end
  # GET /experiences/1
  # GET /experiences/1.json
  def show
  end

  # GET /experiences/new
  def new
		 if current_user.experiences.count < 5
      @experience = Experience.new
    else
     flash[:danger] = "You can add only five Experiences  Details"
     redirect_to edit_experience_path(current_user.experiences.first)
		 end
  end

  # GET /experiences/1/edit
  def edit
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    respond_to do |format|
      if @experience.save
        format.html { redirect_to root_path, notice: 'Experience was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to root_path, notice: 'Experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Experience was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:idExperiences, :Persons_idUser, :dateStarted, :dateFinished, :JobTitles_idJobTitles, :otherJobTitle, :keyDuties, :EmploymentLevels_idLevelsOfEmployment, :employerName, :verified, :howVerified)
    end
	def  require_same_user
    if current_user != @experience.user
				flash[:danger] ="You can only edit or delete your details"
				redirect_to root_path
			end
	end

end
