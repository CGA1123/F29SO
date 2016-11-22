require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe 'GET #show' do
    it do
      user = FactoryGirl.create(:user)
      user.confirm
      sign_in user
      get :show
      expect(response).to be_success
    end
  end
end
