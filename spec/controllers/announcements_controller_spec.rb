require 'rails_helper'

RSpec.describe AnnouncementsController, type: :controller do
  let(:no_permissions) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:project) { FactoryGirl.create(:project) }
  let(:project_announcement) { FactoryGirl.create(:project_announcement) }
  let(:system_announcement) { FactoryGirl.create(:system_announcement) }
  let(:project_params) { { project_announcement: { title: 'Yes', content: 'Oh yes', project: :project } } }
  let(:system_params) { { system_announcement: { title: 'Yes', content: 'Oh yes' } } }

  describe 'POST #create_project_announcement' do
    context 'user with project.announcements.manage permission' do
      before { sign_in root_user }

      context 'parameters invalid' do
        it 'does not post announcement' do
          expect { xhr :post, :create_project_announcement, project_announcement: { title: 'No' } }
            .to change { ProjectAnnouncement.count }.by(0)
        end

        context 'parameters valid' do
          it 'posts new announcement' do
            expect { xhr :post, :create_project_announcement, project_params }
              .to change { ProjectAnnouncement.count }.by(1)
          end

          context 'user without project.announcements.manage permission' do
            it 'throws 404' do
              sign_in no_permissions
              expect { post :create_project_announcement }
                .to raise_error(ActionController::RoutingError)
            end
          end
        end
      end
    end
  end

  describe 'POST #create_system_announcement' do
    context 'user with announcements.manage permission' do
      before { sign_in root_user }

      context 'parameters invalid' do
        it 'does not post announcement' do
          expect { xhr :post, :create_system_announcement, system_announcement: { title: 'No' } }
            .to change { SystemAnnouncement.count }.by(0)
        end

        context 'parameters valid' do
          it 'posts new announcement' do
            expect { xhr :post, :create_system_announcement, system_params }
              .to change { SystemAnnouncement.count }.by(1)
          end

          context 'user without announcements.manage permission' do
            it 'throws 404' do
              sign_in no_permissions
              expect { post :create_system_announcement }
                .to raise_error(ActionController::RoutingError)
            end
          end
        end
      end
    end
  end

  describe 'DELETE #destroy_project_annoucement' do
    context 'user without project.announcements.manage permission' do
      it do
        sign_in no_permissions
        expect { xhr :delete, :destroy_project_annoucement, id: 'nah' }
          .to raise_error(ActionController::RoutingError)
      end
    end

    context 'user with project.announcements.manage permission' do
      it do
        sign_in root_user
        expect { xhr :delete, :destroy_project_annoucement, id: project_announcement.id }
          .to change { ProjectAnnouncement.count }.by(-1)
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
        expect { xhr :delete, :destroy_system_announcement, id: system_announcement.id }
          .to change { SystemAnnouncement.count }.by(-1)
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
      expect(assigned[:project_announcements]).to eq(ProjectAnnouncement.where(projects: Projects.where(user: root_user)).last(5))
    end

    it 'checks @project_announcements assigning' do
      expect(assign[:project_announcements]).not_be be_nil
    end

    it 'assigns @system_announcements' do
      expect(assigned[:system_announcements]).to eq(SystemAnnouncement.last(5))
    end

    it 'checks @system_announcements assigning' do
      expect(assign[:system_announcements]).not_be be_nil
    end
  end
end
