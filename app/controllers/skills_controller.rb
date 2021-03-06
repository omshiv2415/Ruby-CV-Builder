class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /skills
  # GET /skills.json
  def index
    if current_user.try(:admin?)
      @skills = if params[:search]
                  Skill.all.order('created_at DESC')
                else
                  current_user.skills.order('skillType ASC')
                end
    else
      flash[:danger] = 'You must be an admin to perform this activity'
      redirect_to root_path
      end
  end

  # GET /skills/1
  # GET /skills/1.json
  def show
  end

  # GET /skills/new
  def new
    if current_user.skills.count < 11
      @skill = Skill.new
    else
      redirect_to edit_skill_path(current_user.skills.first)
    end
  end

  # GET /skills/1/edit
  def edit
  end
  def message
    flash.now[:notice] = "#{@skill.skillName} is in use as an ingredient and cannot be deleted"
  end
  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user
    respond_to do |format|
      if @skill.save
        format.html { redirect_to root_path, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /skills/1
  # PATCH/PUT /skills/1.json
  def update
    respond_to do |format|
      if @skill.update(skill_params)
        format.html { redirect_to root_path, notice: 'Skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @skill }
      else
        format.html { render :edit }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Skill was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_skill
    @skill = Skill.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def skill_params
    params.require(:skill).permit(:idSkills, :skillType, :Person_idUser, :skill_name, :skillLevel, :verified, :howVerified)
  end

  def require_same_user
    if current_user != @skill.user
      flash[:danger] = 'You can only edit or delete your details'
      redirect_to root_path
       end
  end
end
