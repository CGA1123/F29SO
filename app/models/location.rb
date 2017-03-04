class Location < ActiveRecord::Base
  has_many :users

  has_many :project_locations
  has_many :projects, through: :project_locations

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
