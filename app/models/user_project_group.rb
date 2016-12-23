class UserProjectGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :project_group

  validates :user_id, uniqueness: { scope: :project_group_id }
  validates :user, :project_group, presence: true
end
