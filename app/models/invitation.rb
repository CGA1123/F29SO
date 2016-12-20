class Invitation < ActiveRecord::Base
  has_many :invitation_groups
  has_many :groups, through: :invitation_groups

  validates :groups, :email, :token, :sent_at, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  after_save :deliver_invitation

  def self.find_by_token(token)
    enc_token = Devise.token_generator.digest(Invitation, :token, token)
    Invitation.find_by(token: enc_token)
  end

  def invite
    generate_token
    self.sent_at = Time.now.getlocal
    save
  end

  private

  # TODO: avoid the whole disable/enable callback, also this
  # re saves the record which is not ideal....
  def deliver_invitation
    Invitation.skip_callback(:save, :after, :deliver_invitation)

    generate_token unless @raw_token
    self.sent_at = Time.now.getlocal
    save
    # Send Invite
    InvitationMailer.invitation(email, @raw_token).deliver_later

    Invitation.set_callback(:save, :after, :deliver_invitation)
  end

  def generate_token
    raw, encrypted = Devise.token_generator.generate(Invitation, :token)
    @raw_token = raw
    self.token = encrypted
  end
end
