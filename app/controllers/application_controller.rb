class ApplicationController < ActionController::Base
  before_action :requested_url, unless: :current_user
  helper_method :current_user

  private

  def requested_url
    session[:requested_url] = request.url
  end

  def authenticate_user!
    unless current_user
      redirect_to sign_in_path, alert: "Войдите в учетную запись"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
