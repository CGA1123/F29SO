class InvitationGroup < ActiveRecord::Base
  belongs_to :group
  belongs_to :invitation

  validates :group, :invitation, presence: true
  validates :invitation_id, uniqueness: { scope: :group_id }
end
