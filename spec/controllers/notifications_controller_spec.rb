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
end
