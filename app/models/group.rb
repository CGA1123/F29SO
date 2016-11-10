class Group < ActiveRecord::Base
  validates :group_name, :description, presence: true
  validates :group_name, uniqueness: { case_sensitive: false }
  has_many :group_permissions
  has_many :permissions, through: :group_permissions
end
