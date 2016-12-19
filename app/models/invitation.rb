class Invitation < ActiveRecord::Base
  has_many :invitation_groups
  has_many :groups, through: :invitation_groups

  validates :groups, :email, :token, :sent_at, presence: true
end
