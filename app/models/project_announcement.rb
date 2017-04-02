class ProjectAnnouncement < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :notifications, as: :notifiable
  validates :user, :title, :content, :project, presence: true

  after_create :send_notification

  private

  def send_notification
    recipients = project.users - [user]
    recipients.each do |user|
      Notification.create(recipient: user,
                          actor: self.user,
                          action: :project_announcement,
                          notifiable: self)
    end
  end
end
