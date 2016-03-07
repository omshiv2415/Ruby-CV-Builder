class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index

    if current_user.try(:admin?)
		   @people =  Person.all
		   elsif current_user

        if current_user.people.blank?
          redirect_to new_person_path
          else
           @people1 = current_user.people.find(current_user)
        end

	 	end
  end
def show
   @people = current_user.people.find(current_user)
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'file_name',
        :template => 'welcome/download_my_cv.pdf.erb',
        :layout => 'pdf.html.erb',
        :show_as_html => params[:debug].present?
      end
    end
end
end