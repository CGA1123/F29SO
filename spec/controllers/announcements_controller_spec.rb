require 'rails_helper'

RSpec.describe AnnouncementsController, type: :controller do
  let(:no_permissions) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:project_announcement) do
    FactoryGirl.create(:project_announcement, project: project)
  end
  let(:system_announcement) { FactoryGirl.create(:system_announcement) }
  let(:project_params) do
    { code: project.code, project_announcement: {
      title: 'Yes', content: 'Oh yes', project_id: project.id
    } }
  end

  let(:system_params) do
    { system_announcement: { title: 'Yes', content: 'Oh yes' } }
  end

  describe 'POST #create_project_announcement' do
    context 'user with project.announcements.manage permission' do
      before { sign_in root_user }

      context 'parameters invalid' do
        let(:params) do
          { project_announcement: { title: 'No', project_id: 0 },
            code: project.code }
        end

        it 'does not post announcement' do
          expect { xhr :post, :create_project_announcement, params }
            .to change { ProjectAnnouncement.count }.by(0)
        end
      end

      context 'parameters valid' do
        it 'posts new announcement' do
          expect { xhr :post, :create_project_announcement, project_params }
            .to change { ProjectAnnouncement.count }.by(1)
        end
      end
    end

    context 'user without project.announcements.manage permission' do
      it 'throws 404' do
        sign_in no_permissions
        expect { post :create_project_announcement, project_params }
          .to raise_error(ActionController::RoutingError)
      end
    end
  end

  describe 'POST #create_system_announcement' do
    context 'user with announcements.manage permission' do
      before { sign_in root_user }

      context 'parameters invalid' do
        it 'does not post announcement' do
          xhr :post, :create_system_announcement, system_announcement: { id: 0 }
          expect(SystemAnnouncement.find_by(id: 0)).to be_nil
        end
      end

      context 'parameters valid' do
        it 'posts new announcement' do
          xhr :post, :create_system_announcement, system_params
          expect(SystemAnnouncement.find_by(id: system_announcement.id))
            .not_to be_nil
        end
      end
    end

    context 'user without announcements.manage permission' do
      it 'throws 404' do
        sign_in no_permissions
        expect { post :create_system_announcement }
          .to raise_error(ActionController::RoutingError)
      end
    end
  end

  describe 'DELETE #destroy_project_annoucement' do
    context 'user without project.announcements.manage permission' do
      let(:params) { { code: project.code, id: 'nah' } }
      it do
        sign_in no_permissions
        expect { xhr :delete, :destroy_project_announcement, params }
          .to raise_error(ActionController::RoutingError)
      end
    end

    context 'user with project.announcements.manage permission' do
      it do
        sign_in root_user
        xhr :delete, :destroy_project_announcement, code: project.code,
                                                    id: project_announcement.id
        expect(ProjectAnnouncement.find_by(id: project_announcement.id))
          .to be_nil
      end
    end
  end

  describe 'DELETE #destroy_system_announcement' do
    context 'user without announcements.manage permission' do
      it do
        sign_in no_permissions
        expect { xhr :delete, :destroy_system_announcement, id: 'nah' }
          .to raise_error(ActionController::RoutingError)
      end
    end

    context 'user with announcements.manage permission' do
      it do
        sign_in root_user
        xhr :delete, :destroy_system_announcement, id: system_announcement.id
        expect(SystemAnnouncement.find_by(id: system_announcement.id)).to be_nil
      end
    end
  end

  describe 'GET #index' do
    before do
      sign_in root_user
      get :index
    end

    it do
      expect(response).to be_success
    end

    it 'assigns @project_announcements' do
      expect(assigns[:project_announcements])
        .to eq(ProjectAnnouncement.where(project: root_user.projects).last(5))
    end

    it 'checks @project_announcements assigning' do
      expect(assigns[:project_announcements]).not_to be_nil
    end

    it 'assigns @system_announcements' do
      expect(assigns[:system_announcements]).to eq(SystemAnnouncement.last(5))
    end

    it 'checks @system_announcements assigning' do
      expect(assigns[:system_announcements]).not_to be_nil
    end
  end
end
