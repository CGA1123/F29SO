class Invitation < ActiveRecord::Base
  has_many :invitation_groups
  has_many :groups, through: :invitation_groups

  validates :groups, :email, :token, :sent_at, presence: true
  validates :token, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  def self.with_token(token)
    enc_token = Devise.token_generator.digest(Invitation, :token, token)
    Invitation.find_by(token: enc_token)
  end

  def invite
    generate_token
    self.sent_at = Time.now.getlocal
    if save
      InvitationMailer.invitation(email, @raw_token).deliver_later
      true
    else
      false
    end
  end

  private

  def generate_token
    raw, encrypted = Devise.token_generator.generate(Invitation, :token)
    @raw_token = raw
    self.token = encrypted
  end
end
