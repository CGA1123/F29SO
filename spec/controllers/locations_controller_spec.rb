require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  describe 'GET #index' do
    context 'user not signed in' do
      it_behaves_like 'unauthenticated request',
                      method: :get,
                      action: :index,
                      params: {}
    end

    context 'user is signed in' do
      context 'user does not have permission' do
        before { sign_in user }
        it_behaves_like 'no permission',
                        method: :get,
                        action: :index,
                        params: {}
      end

      context 'user has permission' do
        before do
          sign_in root_user
          get :index
        end

        it do
          expect(response).to be_success
        end

        it 'assigns @locations' do
          expect(assigns[:locations]).to eq(Location.all)
        end
      end
    end
  end
end
