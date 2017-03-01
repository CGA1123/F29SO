class ProjectType < ActiveRecord::Base
  has_many :projects

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  before_destroy :projects?

  def projects?
    projects.count.zero?
  end
end
