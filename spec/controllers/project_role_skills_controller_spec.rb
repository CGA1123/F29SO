require 'rails_helper'

RSpec.describe ProjectRoleSkillsController, type: :controller do
  let(:project_role) { FactoryGirl.create(:project_role) }
  let(:project) { project_role.project }
  let(:skill) { FactoryGirl.create(:skill) }

  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }

  describe 'GET #index' do
    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true,
            method: :get,
            action: :index,
            params: { code: project.code, name: project_role.name } }
        end
      end
    end
  end

  describe 'POST #create' do
    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true,
            method: :post,
            action: :create,
            params: { code: project.code,
                      name: project_role.name,
                      skill_id: skill.id } }
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true,
            method: :delete,
            action: :destroy,
            params: { code: project.code,
                      name: project_role.name,
                      skill_id: skill.id } }
        end
      end
    end
  end
end
