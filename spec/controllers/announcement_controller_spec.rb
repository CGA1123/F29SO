require 'rails_helper'

RSpec.describe AnnouncementController, type: :controller do
  let(:no_permissions) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:announcement) { FactoryGirl.create(:announcement) }

  describe 'GET #index' do
    context 'user not signed in' do
      it_behaves_like 'unauthenticated request' do
        let(:req) { { method: :get, action: :index, params: {} } }
      end
    end

    context 'user is signed in' do
      context 'user does not have permission' do
        before { sign_in user }
        it_behaves_like 'no permission' do
          let(:req) { { method: :get, action: :index, params: {} } }
        end
      end

      context 'user has permission' do
        before do
          sign_in root_user
          get :index
        end

        it do
          expect(response).to be_success
        end

        it 'assigns @announcements' do
          expect(assigns[:announcements]).to eq(Announcement.all)
        end
      end
    end
  end
end
