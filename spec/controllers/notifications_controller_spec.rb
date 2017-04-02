require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:n) do
    FactoryGirl.create(:notification, recipient: no_permission,
                                      action: 'system_announcement')
  end

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
      patch :mark_as_read, format: :json, id: n.id
    end

    it { expect(response).to be_success }

    it 'sets all notifications to read' do
      expect(Notification.find(n.id).read_at).not_to be_nil
    end

    it 'sets @notification' do
      expect(assigns[:notification]).not_to be_nil
    end
  end
end
