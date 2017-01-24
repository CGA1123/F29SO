require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:location) { FactoryGirl.create(:location) }

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

  describe 'GET #edit' do
    context 'user not signed in' do
      it_behaves_like 'unauthenticated request',
                      method: :get,
                      action: :edit,
                      params: { id: 'no_id' }
    end

    context 'user signed in' do
      context 'user does not have permission' do
        before { sign_in user }
        it_behaves_like 'no permission',
                        method: :get,
                        action: :edit,
                        params: { id: 'no_id' }
      end

      context 'user has permission' do
        before { sign_in root_user }
        context 'HTTP request' do
          it do
            get :edit, id: location.id
            expect(response).to be_success
          end
        end

        context 'JS request' do
          it do
            xhr :get, :edit, id: location.id
            expect(response).to be_success
          end
        end
      end
    end
  end

  describe 'PATCH #update' do
    context 'user not signed in' do
      it_behaves_like 'unauthenticated request',
                      method: :get,
                      action: :index,
                      params: { id: 'no_id' }
    end

    context 'user is signed in' do
      context 'user does not have permission' do
        before { sign_in user }
        it_behaves_like 'no permission',
                        method: :patch,
                        action: :update,
                        params: { id: 'no_id' }
      end

      context 'user has permission' do
        before { sign_in root_user }
        context 'valid params' do
          let(:params) { { id: location.id, location: { name: 'breh' } } }
          it 'updates the record' do
            patch :update, params
            expect(location.reload.name).to eq('breh')
          end

          it do
            patch :update, params
            expect(response).to redirect_to(locations_path)
          end
        end

        context 'invalid params' do
          let(:params) { { id: location.id, location: { name: '' } } }

          it 'does not update the record' do
            patch :update, params
            expect(location.reload.name).not_to eq('')
          end

          it do
            patch :update, params
            expect(response).to redirect_to(locations_path)
          end

          it 'sets alert' do
            patch :update, params
            expect(flash[:alert]).to eq('Update failed.')
          end
        end
      end
    end
  end
end
