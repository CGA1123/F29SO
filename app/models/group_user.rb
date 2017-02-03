class GroupUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  validates :group_id, uniqueness: { scope: :user_id }
  validates :user, :group, presence: true

  before_destroy :check_if_last_group

  private

  def check_if_last_group
    user.groups.count > 1
  end
end
