# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :notify_user, only: :create

  private

  def notify_user
    flash[:notice] = "Добро пожаловать, #{current_user.username}!"
  end
end
