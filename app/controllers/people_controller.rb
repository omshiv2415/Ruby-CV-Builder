class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
	before_action :require_user, except: [:index, :show,]
	before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /people
  # GET /people.json

  def index
    if current_user.try(:admin?)
            if params.has_key?(:search_jobpreferences)
             @people = Person.all.select("*").joins(:jobpreferences)
              .where('jobpreferences.job_tile LIKE ?', "%#{params[:search_jobseeker]}%")
            elsif params.has_key?(:search_exp)
             @people = Person.all.select("*").joins(:experience)
              .where('experiences.otherJobTitle LIKE ?', "%#{params[:search_exp]}%")
            elsif params.has_key?(:search_skill)
             @people = Person.all.select("*").joins(:skill)
              .where('skills.skillName LIKE ?', "%#{params[:search_skill]}%")
            else
               @people = Person.order("created_at DESC")
            end

      else
         flash[:danger] = "You must be an admin to perform this activity"
         redirect_to root_path
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'file_name',
        :template => 'people/show.pdf.erb',
        :layout => 'pdf.html.erb',
        :show_as_html => params[:debug].present?
      end
    end
	end
  # GET /people/new
  def new
    if current_user.people.empty?
    @person = Person.new
    else
     redirect_to edit_person_path(current_user.people.first)
		end
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    @person.user = current_user
    respond_to do |format|
      if @person.save
        format.html { redirect_to root_path, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to root_path, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Person was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:title, :forename1, :forename2, :surname, :addressLine1, :addressLine2, :town, :postcode, :secondEmail, :personalUrl, :photo, :female, :postcodeStart, :authorityToWorkStatement, :contactPreference, :EducationalLevels_idEducatonLevel, :noOfGcses, :gecseEnglishGrade, :gcseMathsGrade, :fiveOrMoreGcses, :noOfAlevels, :ucasPoints, :studentStatus, :mobile, :landline, :dob, :penaltyPoints, :mycv)
    end
  def  require_same_user
    if current_user != @person.user
				flash[:danger] ="You can only edit or delete your details"
				redirect_to root_path
			end
    end
end
