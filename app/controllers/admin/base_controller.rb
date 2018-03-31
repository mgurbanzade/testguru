class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'You are not authorized as admin' unless current_user.admin?
  end

  def notice_message(status, resource, action)
    flash[:notice] = t(status, resource: t(resource), action: t(action))
  end
end
