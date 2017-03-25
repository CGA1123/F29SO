require 'rails_helper'

RSpec.describe AnnouncementController, type: :controller do
  let(:no_permissions) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:announcement) { FactoryGirl.create(:announcement) }
  let(:valid_params) { { announcement: { title: 'Yes', content: 'Oh yes' } } }

  describe 'POST #create' do
    context 'user with announcement.manage permission' do
      before { sign_in root_user }

      context 'parameters invalid' do
        it 'does not post announcement' do
          expect { xhr :post, :create, announcement: { title: 'No' } }
            .to change { Announcement.count }.by(0)
        end

        context 'parameters valid' do
          it 'posts new announcement' do
            expect { xhr :post, :create, valid_params }
              .to change { Announcement.count }.by(1)
          end

          context 'user without announcement.manage permission' do
            it 'throws 404' do
              sign_in no_permissions
              expect { post :create }
                .to raise_error(ActionController::RoutingError)
            end
          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user without announcement.manage permission' do
      it do
        sign_in no_permissions
        expect { xhr :delete, :destroy, id: 'nah' }
          .to raise_error(ActionController::RoutingError)
      end
    end

    context 'user with announcement.manage permission' do
      it do
        sign_in root_user
        expect { xhr :delete, :destroy, id: announcement.id }
          .to change { Announcement.count }.by(-1)
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

    it 'assigns @announcements' do
      expect(assigned[:announcements]).to eq(Announcement.all)
    end

    it 'checks @announcement assigning' do
      expect(assign[:announcements]).not_be be_nil
    end
  end
end
