class Location < ActiveRecord::Base
  has_many :users

  has_many :project_role_locations
  has_many :project_roles, through: :project_role_locations

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
