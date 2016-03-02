class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?

	def logged_in?
	!!current_user
	end

	 def require_user
	  if !logged_in?
	  flash[:danger] = "You must be logged in to perform that action"
    redirect_to root_path
   end
 end

end
