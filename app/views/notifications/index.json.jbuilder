json.array! @notifications do |notification|
  json.recipient notification.recipient
  json.actor notification.actor
  json.action notification.action
  json.notifiable notification.notifiable
  json.url create_user_path(notification.notifiable.user, anchor:
    dom_id(notification.notifiable))
end
