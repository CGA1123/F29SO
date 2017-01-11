class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :timeoutable

  has_many :group_users
  has_many :groups, through: :group_users

  has_many :project_group_users
  has_many :project_groups, through: :project_group_users

  validates :groups, :first_name, :last_name, :location, presence: true

  def permission?(permission_name)
    return true if groups.map(&:name).include?('root')
    permission_strings.include?(permission_name)
  end

  def permission_strings
    groups.map(&:permission_strings).flatten.uniq +
      project_groups.map(&:permission_strings).flatten.uniq
  end

  def name
    "#{first_name} #{last_name}"
  end

  def initials
    "#{first_name[0]}#{last_name[0]}"
  end

  # Override the default `send_devise_notification` to use
  # `deliver_later` instead of `deliver_now` for async delivery
  # of emails
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
