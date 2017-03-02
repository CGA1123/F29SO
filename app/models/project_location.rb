class ProjectLocation < ActiveRecord::Base
  belongs_to :project
  belongs_to :location

  validates :project_id, uniqueness: { scope: :location_id }
  validates :project, :location, presence: true
end
