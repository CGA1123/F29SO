require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe 'GET #show' do
    let(:user) { FactoryGirl.create(:user) }

    it do
      sign_in user
      get :show
      expect(response).to be_success
    end
  end
end
