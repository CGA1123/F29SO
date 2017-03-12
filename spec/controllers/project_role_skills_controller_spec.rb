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

    context 'has permission' do
      before { sign_in root_user }
      context 'project exists' do
        context 'role exists' do
          before do
            xhr :get, :index, code: project.code, name: project_role.name
          end

          it 'sets @project' do
            expect(assigns[:project]).to eq(project)
          end

          it 'sets @project_role' do
            expect(assigns[:project_role]).to eq(project_role)
          end

          it 'sets @project_role_skills' do
            expect(assigns[:project_role_skills]) \
              .to eq(ProjectRoleSkill.where(project_role: project_role))
          end
        end

        context 'role does not exist' do
          before { xhr :get, :index, code: project.code, name: 'lel' }
          it 'sets @project' do
            expect(assigns[:project]).to eq(project)
          end

          it 'sets @project_role' do
            expect(assigns[:project_role]).to be_nil
          end

          it 'sets alert' do
            expect(flash[:alert]).to eq('Not Found')
          end
        end
      end

      context 'project does not exist' do
        before { xhr :get, :index, code: 'lel', name: project_role.name }
        it '@project is nil' do
          expect(assigns[:project]).to be_nil
        end

        it 'sets alert' do
          expect(flash[:alert]).to eq('Project not found')
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

    context 'has permission' do
      context 'skill exists' do
        before do
          sign_in root_user
          ProjectRoleSkill.create!(rating: :expert, skill: skill,
                                   project_role: project_role)
          xhr :delete, :destroy,
              code: project.code,
              name: project_role.name,
              skill_id: skill.id
        end

        it 'removes skill from project_role' do
          expect(project_role.skills).not_to include(skill)
        end
      end

      context 'skill does not exist' do
        before do
          sign_in root_user
          xhr :delete, :destroy,
              code: project.code,
              name: project_role.name,
              skill_id: skill.id
        end

        it 'sets alert' do
          expect(flash[:alert]).to eq('Could not find that skill')
        end

        it 'sets @project_role_skill to nil' do
          expect(assigns[:project_role_skill]).to be_nil
        end
      end
    end
  end

  describe 'GET #edit' do
    context 'no permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { xhr: true,
            method: :get,
            action: :edit,
            params: { code: project.code,
                      name: project_role.name } }
        end
      end
    end

    context 'has permission' do
      before do
        sign_in root_user
        xhr :get, :edit, code: project.code, name: project_role.name
      end

      it { expect(response).to render_template('project_role_skills/edit') }

      it 'sets @project_role_skills' do
        expect(assigns[:project_role_skills])
          .to eq(ProjectRoleSkill.where(project_role: project_role))
      end
    end
  end
end
