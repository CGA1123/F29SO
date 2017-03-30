class ProjectAnnouncement < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :user, :title, :content, :project, presence: true
end
