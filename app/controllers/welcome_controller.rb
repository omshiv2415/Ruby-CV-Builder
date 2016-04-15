class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if current_user.try(:admin?)
      @people = Person.all
    elsif current_user
      if current_user.people.blank?
        redirect_to new_person_path
      else
        @people = current_user.people.find(current_user)
        @skills = current_user.skills.all.order(:skillType)
        @experiences = current_user.experiences
        @educatioal_qualifications = current_user.educatioal_qualifications.all.order(created_at: :desc)
        @jobpreferences = current_user.jobpreference
        @referees = current_user.referees
      end
     end
  end

  def show
    if current_user.try(:admin?)
      @people = Person.find(params[:id])
      @skills = Skill.all.where(user_id: params[:id])
      @experiences = Experience.all.where(user_id: params[:id])
      @educatioal_qualifications = EducatioalQualification.all.where(user_id: params[:id])
      @jobpreferences = Jobpreference.all.where(user_id: params[:id])
      @referees = Referee.all.where(user_id: params[:id])

    else current_user

         @people = current_user.people.find(current_user)
         @skills = current_user.skills
         @experiences = current_user.experiences
         @educatioal_qualifications = current_user.educatioal_qualifications.all
         @jobpreferences = current_user.jobpreference
         @referees = current_user.referees
    end
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: @people.forename1.to_s,
               template: 'welcome/download_my_cv.pdf.erb',
               layout: 'pdf.html.erb',
               dpi: '3000',
               background: true,
               show_as_html: params[:debug].present?
      end
    end
  end

  def action1
    redirect_to new_skill_path(@skills)
  end
end
