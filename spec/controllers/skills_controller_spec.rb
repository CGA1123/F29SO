require 'rails_helper'

RSpec.describe SkillsController, type: :controller do
  let(:skill) { FactoryGirl.create(:skill) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:user) { FactoryGirl.create(:user) }
  let(:skill_type) { FactoryGirl.create(:skill_type) }

  describe 'GET #index' do
    before do
      sign_in user
      get :index
    end

    it do
      expect(response).to be_success
    end

    it 'assigns @skills' do
      expect(assigns[:skills]).to eq(Skill.all)
    end

    it 'assigns @skill' do
      expect(assigns[:skill]).not_to be_nil
    end
  end

  describe 'POST #create' do
    context 'user has permission' do
      before { sign_in root_user }

      context 'params valid' do
        before { post :create, valid_params }

        let(:valid_params) do
          { skill: { name: 'test',
                     description: 'X',
                     skill_type_id: skill_type.id } }
        end

        it do
          expect(response).to \
            redirect_to(skill_path(id: valid_params[:skill][:id]))
        end

        it 'creates a new Project' do
          expect(Skill.find_by(name: 'test')).not_to be_nil
        end
      end

      context 'params invalid' do
        let(:invalid_params) do
          { skill: { name: 'test' } }
        end

        before { xhr :post, :create, invalid_params }

        it 'sets @skills' do
          expect(assigns[:projects]).to eq(Skill.all)
        end

        it 'does not create a new Project' do
          expect { xhr :post, :create, invalid_params }
            .not_to change(Skill, :count)
        end
      end
    end

    context 'user does not have permission' do
      before do
        sign_in user
        it_behaves_like 'no permission' do
          let(:req) do
            { method: :post,
              action: :create,
              params: { name: 'test',
                        description: 'This is a test',
                        skill_type_id: skill_type.id },
              xhr: true }
          end
        end
      end
    end
  end

  describe 'PATCH #update' do
    context 'user has permission' do
      before { sign_in root_user }

      context 'project exists' do
        context 'params valid' do
          let(:valid_params) do
            { skill: { name: 'hello' } }
          end

          before { patch :update, valid_params }

          it 'updates the Skill' do
            expect(skill.reload.name).to eq('hello')
          end

          it do
            expect(response).to redirect_to(skill_path(skill.reload.id))
          end
        end

        context 'params invalid' do
          let(:invalid_params) do
            { id: skill.id, skill: { name: '' } }
          end

          it 'updates the Skill' do
            expect { patch :update, invalid_params }
              .not_to change { skill.reload.id }
          end

          it do
            patch :update, invalid_params
            expect(response).to redirect_to(skills_path)
          end
        end
      end

      context 'skill does not exist' do
        before { patch :update, name: 'zzzzzzzz' }

        it do
          expect(response).to redirect_to skills_path
        end
      end
    end

    context 'user does not have permission' do
      before do
        sign_in user
        it_behaves_like 'no permission' do
          let(:req) do
            { method: :post,
              action: :update,
              params: { name: 'test',
                        description: 'This is a test',
                        skill_type_id: skill_type.id },
              xhr: true }
          end
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user has permission' do
      before { sign_in root_user }

      context 'skill does not exist' do
        before { delete :destroy, id: 'waddup' }

        it do
          expect(response).to redirect_to skills_path
        end

        it 'sets alert' do
          expect(flash[:alert]).to eq('Skill not found.')
        end
      end

      context 'skill exists' do
        before { delete :destroy, id: skill.id }
        it 'deletes project' do
          expect(Skill.find_by(id: skill.id)).to be_nil
        end

        it do
          expect(response).to redirect_to(skills_path)
        end
      end
    end

    context 'user does not have permission' do
      before { sign_in user }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :delete,
            action: :destroy,
            params: { name: 'test',
                      description: 'This is a test',
                      skill_type_id: skill_type.id },
            xhr: true }
        end
      end
    end
  end
end
