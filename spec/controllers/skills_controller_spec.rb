require 'rails_helper'

RSpec.describe SkillsController, type: :controller do
  let(:skill) { FactoryGirl.create(:skill) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:user) { FactoryGirl.create(:user) }
  let(:skill_type) { FactoryGirl.create(:skill_type) }

  describe 'POST #create' do
    context 'user has permission' do
      before { sign_in root_user }

      context 'params valid' do
        before { xhr :post, :create, valid_params }

        let(:valid_params) do
          { skill: { name: 'test',
                     description: 'X',
                     skill_type_id: skill_type.id } }
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

        it 'does not create a new Project' do
          expect { xhr :post, :create, invalid_params }
            .not_to change(Skill, :count)
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
            { skill: { name: 'hello' }, id: skill.id }
          end

          before { xhr :patch, :update, valid_params }

          it 'updates the Skill' do
            expect(skill.reload.name).to eq('hello')
          end
        end

        context 'params invalid' do
          let(:invalid_params) do
            { id: skill.id, skill: { name: '' } }
          end

          it 'not updates the Skill' do
            expect { xhr :patch, :update, invalid_params }
              .not_to change { skill.reload.id }
          end
        end
      end

      context 'skill does not exist' do
        before { xhr :patch, :update, id: 'zzzzzzzz' }

        it do
          expect(response.status).to eq(404)
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user has permission' do
      before { sign_in root_user }

      context 'skill does not exist' do
        before { xhr :delete, :destroy, id: 'waddup' }

        it { expect(response.status).to eq(404) }
      end

      context 'skill exists' do
        before { xhr :delete, :destroy, id: skill.id }
        it 'deletes project' do
          expect(Skill.find_by(id: skill.id)).to be_nil
        end
      end
    end
  end
end
