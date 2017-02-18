require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }

  before { sign_in no_permission }

  describe 'GET #index' do
    before { get :index, format: :json }

    it { expect(response).to be_success }

    it 'sets @notifications' do
      expect(assigns[:notifications]).to \
        eq(Notification.where(recipient: no_permission, read_at: nil))
    end
  end

  describe 'PATCH #mark_as_read' do
    before do
      FactoryGirl.create(:notification)
      patch :mark_as_read, format: :json
    end

    it { expect(response).to be_success }

    it 'sets all notifications to read' do
      expect(Notification.where(recipient: no_permission).unread).to be_empty
    end

    it 'sets @notifications' do
      expect(assigns[:notifications]).to \
        eq(Notification.where(recipient: no_permission, read_at: nil))
    end
  end
end
