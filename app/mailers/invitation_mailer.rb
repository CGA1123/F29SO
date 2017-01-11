class InvitationMailer < ApplicationMailer
  def invitation(email, token)
    @token = token
    @email = email
    mail(
      to: email,
      subject: "You've been invited"
    )
  end
end
