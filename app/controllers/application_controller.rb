class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_tests_path
    else
      super
    end
  end

  def configure_permitted_parameters
    attributes = [:username, :password, :email]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end
end
