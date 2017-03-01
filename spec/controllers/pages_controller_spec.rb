require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #user_home' do
    context 'when logged in' do
      it do
        sign_in FactoryGirl.create(:user)
        get :user_home
        expect(response).to be_success
      end
    end

    context 'when not logged in' do
      it_behaves_like 'unauthenticated request' do
        let(:req) { { method: :get, action: :user_home, params: {} } }
      end
    end
  end
end
