class Invitation < ActiveRecord::Base
  has_many :invitation_groups
  has_many :groups, through: :invitation_groups

  validates :groups, :email, :token, :sent_at, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
end
