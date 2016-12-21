class InvitationGroup < ActiveRecord::Base
  belongs_to :group
  belongs_to :invitation

  validates :group_id, uniqueness: { scope: :invitation_id }
end
