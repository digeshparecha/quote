class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_user_notification

  def set_user_notification
    @notifications = @current_user.notifications.unread if current_company
  end

  private

  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end
  helper_method :current_company
  
end
