# :reek:UtilityFunction
class InvitationMailerPreview < ActionMailer::Preview
  def invitation
    InvitationMailer.invitation('email@email.com', 'token_token')
  end
end
