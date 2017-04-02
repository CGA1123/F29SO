module NotificationsHelper
  # Return the path that a notification should link to
  def notification_path_helper(notification)
    notifiable = notification.notifiable
    path = ''
    case notification.action
    when 'project_announcement'
      path = project_announcements_path(code: notifiable.project.code,
                                        id: notifiable.id)
    when 'system_announcement'
      path = announcement_path(id: notifiable.id)
    end
    path
  end

  # Return the message that a notification should display
  def notification_message_helper(notification)
    case notification.action
    when 'project_announcement'
      project_name = notification.notifiable.project.name
      actor_name = notification.actor.name
      message = "#{actor_name} posted a new annoucement in #{project_name}"
    when 'system_announcement'
      message = 'A new system announcement has been posted'
    end
    message
  end
end
