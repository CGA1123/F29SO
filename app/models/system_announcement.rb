class SystemAnnouncement < ActiveRecord::Base
  validates :title, :content, presence: true
end
