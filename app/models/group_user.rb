class GroupUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :group_id, uniqueness: { scope: :user_id }
  validates :user, :group, presence: true

  before_destroy :multiple_groups?

  private

  def multiple_groups?
    user.groups.count > 1
  end
end
