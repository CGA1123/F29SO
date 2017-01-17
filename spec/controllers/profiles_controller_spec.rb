require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  let(:edit_perm) { FactoryGirl.create(:permission, name: 'profile.edit') }
  let(:edit_others_perm) do
    FactoryGirl.create(:permission, name: 'profile.edit.others')
  end

  let(:edit_group) { FactoryGirl.create(:group, permissions: [edit_perm]) }
  let(:edit_others_group) do
    FactoryGirl.create(:group, permissions: [edit_others_perm])
  end

  let(:location) { FactoryGirl.create(:location) }

  context 'User is signed in' do
    before { sign_in user }

    describe 'GET #show' do
      context 'with no permission' do
        context 'assigns @user correctly' do
          it 'equals user' do
            get :show, id: user.id
            expect(assigns['user']).to eq(user)
          end

          it 'equals other_user' do
            get :show, id: other_user.id
            expect(assigns['user']).to eq(other_user)
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

        it 'assigns @can_edit on other_user profile correctly' do
          get :show, id: other_user.id
          expect(assigns['can_edit']).to eq(false)
        end
      end

      context 'with profile.edit permission' do
        before { user.groups << edit_group }

        it 'assigns @can_edit on own profile correctly' do
          get :show, id: user.id
          expect(assigns['can_edit']).to eq(true)
        end

        it 'assigns @can_edit on other_user profile correctly' do
          get :show, id: other_user.id
          expect(assigns['can_edit']).to eq(false)
        end
      end

      context 'with profile.edit.others permission' do
        before { user.groups << edit_others_group }

        it 'assigns @can_edit on own profile correctly' do
          get :show, id: user.id
          expect(assigns['can_edit']).to eq(true)
        end

        it 'assigns @can_edit on other_user profile correctly' do
          get :show, id: other_user.id
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
          before { get :edit, id: other_user.id }
          include_examples 'insufficient permission' do
            let(:id) { other_user.id }
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
          before { get :edit, id: other_user.id }

          include_examples 'insufficient permission' do
            let(:id) { other_user.id }
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
            get :edit, id: other_user.id
            expect(response).to be_success
          end
        end
      end
    end

    describe 'PATCH #update' do
      context 'with no permission' do
        context 'trying to edit his own profile' do
          it_behaves_like 'unsuccessful update' do
            let(:edit_user_id) { user.id }
            let(:location_id) { location.id }
          end
        end

        context 'trying to edit anothers profile' do
          it_behaves_like 'unsuccessful update' do
            let(:edit_user_id) { other_user.id }
            let(:location_id) { location.id }
          end
        end
      end

      context 'with profile.edit permission' do
        before { user.groups << edit_group }

        context 'trying to edit his own profile' do
          it_behaves_like 'successful update' do
            let(:edit_user_id) { user.id }
            let(:location_id) { location.id }
          end
        end

        context 'trying to edit anothers profile' do
          it_behaves_like 'unsuccessful update' do
            let(:edit_user_id) { other_user.id }
            let(:location_id) { location.id }
          end
        end
      end

      context 'with profile.edit.others permission' do
        before { user.groups << edit_others_group }

        context 'trying to edit his own profile' do
          it_behaves_like 'successful update' do
            let(:edit_user_id) { user.id }
            let(:location_id) { location.id }
          end
        end

        context 'trying to edit anothers profile' do
          it_behaves_like 'successful update' do
            let(:edit_user_id) { other_user.id }
            let(:location_id) { location.id }
          end
        end

        context 'with invalid params' do
          it 're renders edit view through html' do
            patch :update, id: user.id, user: { location_id: 'breh' }
            expect(response).to render_template(:edit)
          end

          it 're renders edit view thorugh js' do
            xhr :patch, :update, id: user.id, user: { location_id: 'breh' }
            expect(response).to render_template(:edit)
          end
        end
      end
    end
  end

  context 'User is not signed in' do
    describe 'GET #show' do
      it_behaves_like 'unauthenticated request',
                      method: 'get',
                      action: :show,
                      params: { id: 'id_shouldnt_matter' }
    end

    describe 'GET #edit' do
      it_behaves_like 'unauthenticated request',
                      method: 'get',
                      action: :edit,
                      params: { id: 'id_shouldnt_matter' }
    end

    describe 'PATCH #update' do
      it_behaves_like 'unauthenticated request',
                      method: 'patch',
                      action: :update,
                      params: { id: 'id_shouldnt_matter' }
    end
  end
end
