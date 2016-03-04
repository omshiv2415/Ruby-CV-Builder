class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
		if current_user
			 @people =  Person.all
     # @people = current_user.people.find(current_user).photo
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