class ProjectAnnouncement < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :notifications, as: :notifiable
  validates :user, :title, :content, :project, presence: true
end
