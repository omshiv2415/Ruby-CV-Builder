class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
     @people = Person.all
     @person = Person.new
  end

end
