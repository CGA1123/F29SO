class ProjectAnnouncement < ActiveRecord::Base
  belongs_to :projects

  validates :title, :content, :projects, presence: true
end
