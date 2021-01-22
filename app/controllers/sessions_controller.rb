class SessionsController < ApplicationController
  skip_before_action :requested_url
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:requested_url]
      session.delete(:requested_url)
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    #@current_user = nil
    redirect_to tests_path
  end
end
