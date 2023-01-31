class NotificationsController < ApplicationController

  def destroy
    notification = Notification.find_by_id(params[:id])
    notification.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(notification) }
    end
  end

end