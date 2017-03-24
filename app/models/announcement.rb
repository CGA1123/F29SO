class Announcement < ActiveRecord::Base
  has_many :project_announcements
  has_many :projects, through: :project_announcements

  validates :title, :content, presence: true
end
