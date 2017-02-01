class Invitation < ActiveRecord::Base
  belongs_to :inviter, class_name: 'User', foreign_key: 'inviter_id'
  has_many :invitation_groups, dependent: :destroy
  has_many :groups, through: :invitation_groups

  validates :groups, :email, :token, :sent_at, :inviter, presence: true
  validates :token, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  validate :user_email_not_taken

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

  def user_email_not_taken
    errors.add(:email, 'is already taken') if User.find_by(email: email)
  end

  def generate_token
    raw, encrypted = Devise.token_generator.generate(Invitation, :token)
    @raw_token = raw
    self.token = encrypted
  end
end
