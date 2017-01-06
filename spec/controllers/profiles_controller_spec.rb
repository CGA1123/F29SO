require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:another_user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  let(:edit_perm) { FactoryGirl.create(:permission, name: 'profile.edit') }
  let(:edit_others_perm) do
    FactoryGirl.create(:permission, name: 'profile.edit.others')
  end

  let(:edit_group) { FactoryGirl.create(:group, permissions: [edit_perm]) }
  let(:edit_others_group) do
    FactoryGirl.create(:group, permissions: [edit_others_perm])
  end

  context 'User is signed in' do
    before { sign_in user }

    describe 'GET #show' do
      context 'with no permission' do
        context 'assigns @user correctly' do
          it 'equals user' do
            get :show, id: user.id
            expect(assigns['user']).to eq(user)
          end

          it 'equals another_user' do
            get :show, id: another_user.id
            expect(assigns['user']).to eq(another_user)
          end
        end

        it 'assigns @groups correctly' do
          get :show, id: user.id
          expect(assigns['groups']).to eq(user.groups)
        end

        it 'assigns @can_edit on own profile correctly' do
          get :show, id: user.id
          expect(assigns['can_edit']).to eq(false)
        end

        it 'assigns @can_edit on another_user profile correctly' do
          get :show, id: another_user.id
          expect(assigns['can_edit']).to eq(false)
        end
      end

      context 'with profile.edit permission' do
        before { user.groups << edit_group }

        it 'assigns @can_edit on own profile correctly' do
          get :show, id: user.id
          expect(assigns['can_edit']).to eq(true)
        end

        it 'assigns @can_edit on another_user profile correctly' do
          get :show, id: another_user.id
          expect(assigns['can_edit']).to eq(false)
        end
      end

      context 'with profile.edit.others permission' do
        before { user.groups << edit_others_group }

        it 'assigns @can_edit on own profile correctly' do
          get :show, id: user.id
          expect(assigns['can_edit']).to eq(true)
        end

        it 'assigns @can_edit on another_user profile correctly' do
          get :show, id: another_user.id
          expect(assigns['can_edit']).to eq(true)
        end
      end
    end

    describe 'GET #edit' do
      context 'with no permission' do
        context 'trying to edit his own profile' do
          before { get :edit, id: user.id }
          include_examples 'insufficient permission' do
            let(:id) { user.id }
          end
        end

        context 'trying to edit anothers profile' do
          before { get :edit, id: another_user.id }
          include_examples 'insufficient permission' do
            let(:id) { another_user.id }
          end
        end
      end

      context 'with profile.edit permission' do
        before { user.groups << edit_group }

        context 'trying to edit his own profile' do
          before { get :edit, id: user.id }

          it 'renders the edit form' do
            expect(response).to be_success
          end

          context 'user does not exist' do
            it 'redirects to root' do
              get :edit, id: 'hello'
              expect(response).to redirect_to(authenticated_root_path)
            end

            it 'sets alert' do
              get :edit, id: 'hello'
              expect(flash[:alert]).to eq('User not found.')
            end
          end
        end

        context 'trying to edit anothers profile' do
          before { get :edit, id: another_user.id }

          include_examples 'insufficient permission' do
            let(:id) { another_user.id }
          end
        end
      end

      context 'with profile.edit.others permission' do
        before { user.groups << edit_others_group }

        context 'trying to edit his own profile' do
          it 'renders the edit form' do
            get :edit, id: user.id
            expect(response).to be_success
          end
        end

        context 'trying to edit anothers profile' do
          it 'renders the edit form' do
            get :edit, id: another_user.id
            expect(response).to be_success
          end
        end
      end
    end

    describe 'PATCH #update' do
      context 'with no permission' do
        context 'trying to edit his own profile' do
          before do
            patch :update, id: user.id, user: { location: 'Earth' }
          end

          it 'does not update the profile' do
            expect(user.reload.location).not_to eq('Earth')
          end

          include_examples 'insufficient permission' do
            let(:id) { user.id }
          end
        end

        context 'trying to edit anothers profile' do
          before do
            patch :update, id: another_user.id, user: { location: 'Earth' }
          end

          it 'does not update the profile' do
            expect(another_user.reload.location).not_to eq('Earth')
          end

          include_examples 'insufficient permission' do
            let(:id) { another_user.id }
          end
        end
      end

      context 'with profile.edit permission' do
        before { user.groups << edit_group }

        context 'trying to edit his own profile' do
          before do
            patch :update, id: user.id, user: { location: 'Earth' }
          end

          it 'updates the profile' do
            expect(user.reload.location).to eq('Earth')
          end

          it 'redirects to #show' do
            expect(response).to redirect_to(profile_path(id: user.id))
          end

          it 'does not display an alert' do
            expect(flash[:alert]).to be_nil
          end
        end

        context 'trying to edit anothers profile' do
          before do
            patch :update, id: another_user.id, user: { location: 'Earth' }
          end

          it 'does not update the profile' do
            expect(another_user.reload.location).not_to eq('Earth')
          end

          include_examples 'insufficient permission' do
            let(:id) { another_user.id }
          end
        end
      end

      context 'with profile.edit.others permission' do
        before { user.groups << edit_others_group }

        context 'trying to edit his own profile' do
          before do
            patch :update, id: user.id, user: { location: 'Earth' }
          end

          it 'updates the profile' do
            expect(user.reload.location).to eq('Earth')
          end

          it 'redirects to #show' do
            expect(response).to redirect_to(profile_path(id: user.id))
          end

          it 'does not display an alert' do
            expect(flash[:alert]).to be_nil
          end
        end

        context 'trying to edit anothers profile' do
          before do
            patch :update, id: another_user.id, user: { location: 'Earth' }
          end

          it 'updates the profile' do
            expect(another_user.reload.location).to eq('Earth')
          end

          it 'redirects to #show' do
            expect(response).to redirect_to(profile_path(id: another_user.id))
          end

          it 'does not displays an alert' do
            expect(flash[:alert]).to be_nil
          end
        end
      end
    end
  end

  context 'User is not signed in' do
    param = { id: 'id_shouldnt_matter' }

    describe 'GET #show' do
      it_behaves_like 'unauthenticated request',
                      method: 'get',
                      action: :show,
                      params: param
    end

    describe 'GET #edit' do
      it_behaves_like 'unauthenticated request',
                      method: 'get',
                      action: :edit,
                      params: param
    end

    describe 'PATCH #update' do
      it_behaves_like 'unauthenticated request',
                      method: 'patch',
                      action: :update,
                      params: param
    end
  end
end
