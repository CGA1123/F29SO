class ProjectGroupUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :project_group

  validates :project_group_id, uniqueness: { scope: :user_id }
  validates :user, :project_group, presence: true
end
