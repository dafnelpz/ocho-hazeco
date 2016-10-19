class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

	def authenticate_admin_user!
		unless signed_in? and (current_user.role.admin or current_user.role.agent)
			flash[:alert] = "No puedes visitar esta página."
			redirect_to root_path
		end
	end

	def access_denied(exception)
		flash[:error] = "Sin acceso"
		redirect_to root_path
	end

	protected

		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :phone, :address, :password, :password_confirmation])
		end

end