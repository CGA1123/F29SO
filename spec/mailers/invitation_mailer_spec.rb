require 'rails_helper'

RSpec.describe InvitationMailer, type: :mailer do
  describe '#invitation' do
    let(:mail) { InvitationMailer.invitation('email@email.com', 'token') }

    it 'sends email to correct address' do
      expect(mail.to).to contain_exactly('email@email.com')
    end

    it 'returns a mail object' do
      expect(mail).to be_kind_of(ActionMailer::MessageDelivery)
    end
  end
end
