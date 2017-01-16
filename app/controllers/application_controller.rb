class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  decent_configuration { strategy DecentExposure::StrongParametersStrategy }

  def after_sign_in_path_for(resource)
    visitors_path
  end 
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      sanitized_params = %i(
        email
        password
        password_confirmation
      )
      u.permit(sanitized_params)
    end
  end
end
