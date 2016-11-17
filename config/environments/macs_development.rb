# Use same configuration as `development.rb`
require Rails.root.join("config/environments/development")

Rails.application.configure do
    config.web_console.development_only = false
end
