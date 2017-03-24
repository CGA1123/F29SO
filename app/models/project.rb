class Project < ActiveRecord::Base
  belongs_to :project_type

  has_many :project_announcements
  has_many :announcements, through: :project_announcements

  has_many :project_roles, dependent: :delete_all
  has_many :users, -> { distinct }, through: :project_roles

  has_many :locations, -> { distinct }, through: :project_roles

  validates :name, :code, :description, :project_type, presence: true
  validates :code, uniqueness: { case_sensitive: false }

  def self.search(string)
    where('lower(projects.name) LIKE :string OR ' \
          'lower(projects.code) LIKE :string ',
          string: "%#{string.downcase}%")
  end
end
