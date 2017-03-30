json.array! @notifications do |notification|
  json.recipient notification.recipient
  json.actor notification.actor
  json.message notification.recipient
  json.action notification.action
  json.notifiable do #notification.notifiable
    json.type "There is a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url announcement_path(id:notification.notifiable.id)
end

#  json.message notification_message_helper(notification)
#  json.url notification_path_helper(notification)
