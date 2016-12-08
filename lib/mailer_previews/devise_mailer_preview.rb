module Devise
  class MailerPreview < ActionMailer::Preview
    def confirmation_instructions
      Devise::Mailer.confirmation_instructions(User.first, 'token_token')
    end

    def reset_password_instructions
      Devise::Mailer.reset_password_instructions(User.first, 'token_token')
    end

    def password_change
      Devise::Mailer.password_change(User.first)
    end
  end
end
