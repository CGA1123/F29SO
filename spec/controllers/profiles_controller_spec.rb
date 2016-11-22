require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe 'GET #show' do
    it do
      sign_in FactoryGirl.create(:user)
      get :show
      expect(response).to be_success
    end
  end
end
