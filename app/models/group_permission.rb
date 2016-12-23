class GroupPermission < ActiveRecord::Base
  belongs_to :group
  belongs_to :permission

  validates :group_id, uniqueness: { scope: :permission_id }
  validates :group, :permission, presence: true
end
