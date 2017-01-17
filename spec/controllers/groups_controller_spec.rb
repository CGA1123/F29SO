require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  describe 'GET #index' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it 'throws 404' do
        expect { get :index }.to raise_error(ActionController::RoutingError)
      end
    end

    context 'User does have permission' do
      before do
        sign_in root_user
        get :index
      end

      it do
        expect(response).to be_success
      end
    end
  end
end
