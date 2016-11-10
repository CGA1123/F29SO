class Permission < ActiveRecord::Base
  validates :permission_string, :description, presence: true
  validates :permission_string, uniqueness: { case_sensitive: false }
  has_many :group_permissions
  has_many :groups, through: :group_permissions
end
