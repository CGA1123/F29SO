json.array! @notifications do |notification|
  json.message notification_message_helper(notification)
  json.url notification_path_helper(notification)
end
