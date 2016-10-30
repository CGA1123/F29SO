require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #user_home' do
    context 'when logged in' do
      it do
        user = FactoryGirl.create(:user)
        user.confirm
        sign_in user
        get :user_home
        expect(response).to be_success
      end
    end

    context 'when not logged in' do
      it 'redirects to login page' do
        get :user_home
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
