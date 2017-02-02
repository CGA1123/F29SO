require 'rails_helper'

RSpec.describe GroupUsersController, type: :controller do
  let(:group) { FactoryGirl.create(:group) }
  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe 'GET #index' do
    before { get :index, name: group.name }

    it { expect(response).to be_success }

    it 'sets @group' do
      expect(assigns[:group]).to eq(group)
    end
  end

  describe 'POST #create' do
    before { post :create, name: group.name }

    it { expect(response).to be_redirect }

    it 'sets @group' do
      expect(assigns[:group]).to eq(group)
    end
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, name: group.name }

    it { expect(response).to be_redirect }

    it 'sets @group' do
      expect(assigns[:group]).to eq(group)
    end
  end
end
