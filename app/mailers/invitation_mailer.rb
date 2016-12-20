class InvitationMailer < ApplicationMailer
  def invitation(email, token)
    @token = token
    @email = email
    mail(
      to: @email,
      from: 'change_me@change_me.com',
      subject: "You've been invited"
    )
  end
end
