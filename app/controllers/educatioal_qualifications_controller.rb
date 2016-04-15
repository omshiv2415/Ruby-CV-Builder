class EducatioalQualificationsController < ApplicationController
  before_action :set_educatioal_qualification, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /educatioal_qualifications
  # GET /educatioal_qualifications.json

  def index
    if current_user.try(:admin?)
      @educatioal_qualifications = EducatioalQualification.all
    else
      flash[:danger] = 'You must be an admin to perform this activity'
      redirect_to root_path
    end
   end

  # GET /educatioal_qualifications/1
  # GET /educatioal_qualifications/1.json
  def show
  end

  # GET /educatioal_qualifications/new
  def new
    if current_user.educatioal_qualifications.count < 5
      @educatioal_qualification = EducatioalQualification.new
    else
      flash[:danger] = 'You can add only five Education Details'
      redirect_to edit_educatioal_qualification_path(current_user.educatioal_qualifications.first)
     end
  end

  # GET /educatioal_qualifications/1/edit
  def edit
  end

  # POST /educatioal_qualifications
  # POST /educatioal_qualifications.json
  def create
    @educatioal_qualification = EducatioalQualification.new(educatioal_qualification_params)
    @educatioal_qualification.user = current_user
    respond_to do |format|
      if @educatioal_qualification.save
        format.html { redirect_to root_path, notice: 'Educatioal qualification was successfully created.' }
        format.json { render :show, status: :created, location: @educatioal_qualification }
      else
        format.html { render :new }
        format.json { render json: @educatioal_qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /educatioal_qualifications/1
  # PATCH/PUT /educatioal_qualifications/1.json
  def update
    respond_to do |format|
      if @educatioal_qualification.update(educatioal_qualification_params)
        format.html { redirect_to root_path, notice: 'Educatioal qualification was successfully updated.' }
        format.json { render :show, status: :ok, location: @educatioal_qualification }
      else
        format.html { render :edit }
        format.json { render json: @educatioal_qualification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educatioal_qualifications/1
  # DELETE /educatioal_qualifications/1.json
  def destroy
    @educatioal_qualification.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Educatioal qualification was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_educatioal_qualification
    @educatioal_qualification = EducatioalQualification.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def educatioal_qualification_params
    params.require(:educatioal_qualification).permit(:idEducationalQualification, :Persons_idUser, :qualificationType, :courseName, :EducationalLevels_idEducationLevel, :vocational, :mainSubject, :nameOfInstitutions, :country, :yearObtained, :result, :thesesTitle, :verified, :howVerified)
  end

  def require_same_user
    if current_user != @educatioal_qualification.user
      flash[:danger] = 'You can only edit or delete your details'
      redirect_to root_path
      end
   end
end
