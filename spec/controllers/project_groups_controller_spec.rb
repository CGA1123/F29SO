require 'rails_helper'

RSpec.describe ProjectGroupsController, type: :controller do
  let(:project_group) { FactoryGirl.create(:project_group) }
  let(:user) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let (:project) { FactoryGirl.create(:project) }

  describe 'GET #index' do

    before do
      sign_in user
    end

    it do
      get :index, code: project.code
      expect(assigns[:project_groups]).to eq(project.project_groups)
    end
  end
end
