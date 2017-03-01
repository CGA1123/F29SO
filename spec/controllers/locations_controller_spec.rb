require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:location) { FactoryGirl.create(:location) }

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

        it 'assigns @locations' do
          expect(assigns[:locations]).to eq(Location.all)
        end
      end
    end
  end

  describe 'GET #edit' do
    context 'user not signed in' do
      it_behaves_like 'unauthenticated request' do
        let(:req) { { method: :get, action: :edit, params: { id: 'id' } } }
      end
    end

    context 'user signed in' do
      context 'user does not have permission' do
        before { sign_in user }
        it_behaves_like 'no permission' do
          let(:req) { { method: :get, action: :edit, params: { id: 'id' } } }
        end
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
      it_behaves_like 'unauthenticated request' do
        let(:req) do
          { method: :patch, action: :update, params: { id: 'no_id' } }
        end
      end
    end

    context 'user is signed in' do
      context 'user does not have permission' do
        before { sign_in user }
        it_behaves_like 'no permission' do
          let(:req) { { method: :patch, action: :update, params: { id: 'i' } } }
        end
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

  describe 'POST #create' do
    context 'user not signed in' do
      it_behaves_like 'unauthenticated request' do
        let(:req) { { method: :post, action: :create, params: { id: 'id' } } }
      end
    end

    context 'user is signed in' do
      context 'user does not have permission' do
        before { sign_in user }
        it_behaves_like 'no permission' do
          let(:req) { { method: :post, action: :create, params: { id: 'i' } } }
        end
      end

      context 'user has permission' do
        before { sign_in root_user }

        context 'valid params' do
          let(:params) { { location: { name: 'valid' } } }

          it 'creates a new record' do
            expect { post :create, params }
              .to change(Location, :count).by(1)
          end

          it do
            post :create, params
            expect(response).to redirect_to locations_path
          end
        end

        context 'invalid params' do
          let(:params) { { location: { name: '' } } }

          it 'does not create a new record' do
            expect { post :create, params }
              .to change(Location, :count).by(0)
          end

          it do
            post :create, params
            expect(response).to redirect_to locations_path
          end

          it do
            post :create, params
            expect(flash[:alert]).to eq('Creation failed.')
          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user not signed in' do
      it_behaves_like 'unauthenticated request' do
        let(:req) do
          { method: :delete, action: :destroy, params: { id: 'id' } }
        end
      end
    end

    context 'user is signed in' do
      context 'user does not have permission' do
        before { sign_in user }
        it_behaves_like 'no permission' do
          let(:req) do
            { method: :delete, action: :destroy, params: { id: 'id' } }
          end
        end
      end

      context 'user has permission' do
        before do
          sign_in root_user
        end

        context 'valid params' do
          loc = FactoryGirl.create(:location)

          context 'a record point to the location' do
            before do
              root_user.location = loc
              root_user.save
            end

            it 'does not delete a location' do
              expect { delete :destroy, id: loc.id }
                .not_to change(Location, :count)
            end

            it do
              delete :destroy, id: loc.id
              expect(response).to redirect_to(locations_path)
            end

            it do
              delete :destroy, id: loc.id
              expect(flash[:alert]).to eq('This location is still has a user')
            end
          end

          context 'no record points to the location' do
            it 'deletes the location' do
              expect { delete :destroy, id: loc.id }
                .to change(Location, :count).by(-1)
            end

            it do
              delete :destroy, id: loc.id
              expect(response).to redirect_to(locations_path)
            end
          end
        end

        context 'invalid params' do
          it 'does not delete a location' do
            expect { delete :destroy, id: 'does not exist' }
              .not_to change(Location, :count)
          end

          it do
            delete :destroy, id: 'does not exist'
            expect(response).to redirect_to(locations_path)
          end
        end
      end
    end
  end
end
