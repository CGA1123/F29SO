require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:location) { FactoryGirl.create(:location) }

  describe 'PATCH #update' do
    context 'user is signed in' do
      context 'user has permission' do
        before { sign_in root_user }
        context 'valid params' do
          let(:params) { { id: location.id, location: { name: 'breh' } } }
          it 'updates the record' do
            xhr :patch, :update, params
            expect(location.reload.name).to eq('breh')
          end
        end

        context 'invalid params' do
          let(:params) { { id: location.id, location: { name: '' } } }

          it 'does not update the record' do
            xhr :patch, :update, params
            expect(location.reload.name).not_to eq('')
          end
        end
      end
    end
  end

  describe 'POST #create' do
    context 'user is signed in' do
      context 'user has permission' do
        before { sign_in root_user }

        context 'valid params' do
          let(:params) { { location: { name: 'valid' } } }

          it 'creates a new record' do
            expect { xhr :post, :create, params }
              .to change(Location, :count).by(1)
          end
        end

        context 'invalid params' do
          let(:params) { { location: { name: '' } } }

          it 'does not create a new record' do
            expect { xhr :post, :create, params }
              .to change(Location, :count).by(0)
          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user is signed in' do
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
              expect { xhr :delete, :destroy, id: loc.id }
                .not_to change(Location, :count)
            end
          end

          context 'no record points to the location' do
            it 'deletes the location' do
              expect { xhr :delete, :destroy, id: loc.id }
                .to change(Location, :count).by(-1)
            end
          end
        end

        context 'invalid params' do
          it 'does not delete a location' do
            expect { xhr :delete, :destroy, id: 'does not exist' }
              .not_to change(Location, :count)
          end
        end
      end
    end
  end
end
