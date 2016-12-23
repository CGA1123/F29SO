class GroupPermission < ActiveRecord::Base
  belongs_to :group
  belongs_to :permission

  validates :permission_id, uniqueness: { scope: :group_id }
  validates :group, :permission, presence: true
end
