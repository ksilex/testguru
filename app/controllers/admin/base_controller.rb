class Admin::BaseController < ApplicationController
  before_action :admin_required!

  layout "admin"

  private

  def admin_required!
    redirect_to root_path, alert: "Нет прав для доступа к этой страницы" unless current_user.admin?
  end
end
