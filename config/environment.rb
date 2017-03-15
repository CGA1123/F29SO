# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Set current commit
COMMIT = `git log --pretty=format:'%h' -n 1`
