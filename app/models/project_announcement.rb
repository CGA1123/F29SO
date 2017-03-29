class ProjectAnnouncement < ActiveRecord::Base
  belongs_to :project

  validates :title, :content, :project, presence: true
end
