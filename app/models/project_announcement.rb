class ProjectAnnouncement < ActiveRecord::Base
  belongs_to :projects
  belongs_to :announcements

  validates :announcements, presence: true
end
