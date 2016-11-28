require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  context 'User is signed in' do
    describe 'GET #show' do
      before do
        sign_in user
        get :show, id: user.id
      end

      it do
        expect(response).to be_success
      end
    end
  end

  context 'User is not signed in' do
    describe 'GET #show' do
      it do
        get :show, id: 'id_shouldnt_matter'
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #edit' do
      it do
        get :edit, id: 'id_shouldnt_matter'
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'PATCH #update' do
      it do
        patch :update, id: 'id_shouldnt_matter'
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
