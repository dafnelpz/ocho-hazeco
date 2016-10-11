class WelcomeController < ApplicationController
  def index
  	if signed_in?
      redirect_to users_profile_path(id: current_user.id)
    end
  end
end
