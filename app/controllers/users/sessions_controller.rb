# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :notify_user, only: :create

  def profile
    @badges = current_user.badges_hash
  end

  private

  def notify_user
    flash[:notice] = t(".welcome", username: current_user.username)
  end
end
