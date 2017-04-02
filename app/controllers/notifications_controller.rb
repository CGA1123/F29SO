class NotificationsController < PermissionController
  before_action :set_notifications

  def index
    @notifications = Notification.where(recipient: current_user).unread
  end

  def mark_as_read
    @notification = Notification.find_by(recipient: current_user,
                                         id: params[:id])
    @notification.update(read_at: Time.zone.now) if @notification
    render json: { success: true }
  end

  private

  def set_notifications
    @notifications = Notification.where(recipient: current_user).unread
  end
end
