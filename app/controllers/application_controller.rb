class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def authenticate_admin_user!
		unless signed_in? and (current_user.role.admin or current_user.role.agent)
			flash[:alert] = "You are not allowed to visit this page"
			redirect_to root_path
		end
	end
end
