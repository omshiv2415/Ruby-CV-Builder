class RefereesController < ApplicationController
  before_action :set_referee, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  # GET /referees
  # GET /referees.json

  def index
    if current_user.try(:admin?)
      @referees = Referee.all
    else
      flash[:danger] = 'You must be an admin to perform this activity'
      redirect_to root_path
    end
 end

  # GET /referees/1
  # GET /referees/1.json
  def show
  end

  # GET /referees/new
  def new
    if current_user.referees.count <= 2
      @referee = Referee.new
    else
      flash[:danger] = 'You can add only two References  Details'
      redirect_to edit_referee_path(current_user.referees.first)
      end
  end

  # GET /referees/1/edit
  def edit
  end

  # POST /referees
  # POST /referees.json
  def create
    @referee = Referee.new(referee_params)
    @referee.user = current_user
    respond_to do |format|
      if @referee.save
        format.html { redirect_to root_path, notice: 'Referee was successfully created.' }
        format.json { render :show, status: :created, location: @referee }
      else
        format.html { render :new }
        format.json { render json: @referee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referees/1
  # PATCH/PUT /referees/1.json
  def update
    respond_to do |format|
      if @referee.update(referee_params)
        format.html { redirect_to root_path, notice: 'Referee was successfully updated.' }
        format.json { render :show, status: :ok, location: @referee }
      else
        format.html { render :edit }
        format.json { render json: @referee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referees/1
  # DELETE /referees/1.json
  def destroy
    @referee.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Referee was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_referee
    @referee = Referee.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def referee_params
    params.require(:referee).permit(:idReferees, :Persons_idUser, :title, :forename, :surname, :email, :contactPhone, :relationship, :permissionToContact, :verified, :howVerified, :referenceDoc)
  end

  def  require_same_user
    if current_user != @referee.user
      flash[:danger] = 'You can only edit or delete your details'
      redirect_to root_path
      end
  end
end
