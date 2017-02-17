require 'rails_helper'

RSpec.describe AdminPanelController, type: :controller do
  let(:no_permissions) { FactoryGirl.create(:user) }
  describe 'GET #home' do
    before do
      sign_in no_permissions
      get :home
    end

    it { expect(response).to be_success }
  end
end
