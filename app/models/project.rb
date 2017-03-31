class Project < ActiveRecord::Base
  belongs_to :project_type

  has_many :project_announcements, dependent: :destroy
  has_many :project_roles, dependent: :delete_all
  has_many :users, -> { distinct }, through: :project_roles

  has_many :locations, -> { distinct }, through: :project_roles

  validates :name, :code, :description, :project_type, :start_date,
            :end_date, presence: true

  validates :code, uniqueness: { case_sensitive: false }
  validate :end_date_after_start_date?

  def self.search(string)
    where('lower(projects.name) LIKE :string OR ' \
          'lower(projects.code) LIKE :string ',
          string: "%#{string.downcase}%")
  end

  private

  def end_date_after_start_date?
    return false if end_date.nil? || start_date.nil?
    errors.add :end_date, 'must be after start date' if end_date < start_date
  end
end
