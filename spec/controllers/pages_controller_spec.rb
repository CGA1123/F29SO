require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:root_user) { FactoryGirl.create(:root_user) }

  describe 'GET #user_home' do
    context 'when logged in' do
      before do
        sign_in root_user
        get :user_home
      end

      it { expect(response).to be_success }

      it 'assigns @projects' do
        expect(assigns[:projects])
          .to eq(root_user.projects)
      end

      it 'assigns @project_announcements' do
        expect(assigns[:project_announcements])
          .to eq(ProjectAnnouncement.where(project: root_user.projects)
          .order('created_at DESC').first(5))
      end

      it 'assigns @system_announcements' do
        expect(assigns[:system_announcements])
          .to eq(SystemAnnouncement.last(5).reverse)
      end
    end

    context 'when not logged in' do
      it_behaves_like 'unauthenticated request' do
        let(:req) { { method: :get, action: :user_home, params: {} } }
      end
    end
  end
end
