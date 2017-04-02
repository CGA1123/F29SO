class SystemAnnouncement < ActiveRecord::Base
  belongs_to :user

  validates :user, :title, :content, presence: true
  has_many :notifications, as: :notifiable
  after_create :send_notification

  private

  def send_notification
    recipients = User.all - [user]
    recipients.each do |user|
      Notification.create(recipient: user,
                          actor: self.user,
                          action: :system_announcement,
                          notifiable: self)
    end
  end
end
