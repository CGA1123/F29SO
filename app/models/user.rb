class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :timeoutable

  belongs_to :location

  has_many :group_users, dependent: :delete_all
  has_many :groups, through: :group_users

  has_many :project_group_users
  has_many :project_groups, through: :project_group_users

  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :notifications, foreign_key: :recipient_id

  validates :groups, :first_name, :last_name, :location, presence: true

  def self.search(string)
    where('lower(first_name) LIKE :string OR ' \
          'lower(email) LIKE :string OR ' \
          'lower(last_name) LIKE :string',
          string: "%#{string.downcase}%")
  end

  def permission?(*permissions)
    return true if groups.map(&:name).include?('root')
    (permission_strings & permissions).present?
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
