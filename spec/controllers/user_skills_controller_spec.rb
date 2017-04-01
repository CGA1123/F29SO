require 'rails_helper'

RSpec.describe UserSkillsController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:user_skill) { FactoryGirl.create(:user_skill, user: root_user) }
  let(:skill) { FactoryGirl.create(:skill) }

  describe 'POST #create' do
    context 'User does not have permission' do
      before do
        sign_in no_permission
        xhr :post, :create, id: no_permission.id
      end

      it 'sets alert' do
        expect(flash[:alert]).to eq('No Permission')
      end
    end

    context 'User does have permission' do
      before { sign_in root_user }

      context 'valid params' do
        before do
          xhr :post, :create, id: root_user.id, user_skill: {
            skill_id: skill.name, rating: 'expert'
          }
        end

        it 'creates a new user skill' do
          expect(UserSkill.find_by(skill: skill, user: root_user)).not_to be_nil
        end

        it do
          expect(response).to render_template('user_skills/create')
        end
      end

      context 'invalid params' do
        let(:params) do
          { id: root_user.id, user_skill: {
            skill_id: '', rating: 'basic'
          } }
        end

        it 'does not create new skill' do
          expect { xhr :post, :create, params }
            .to change(UserSkill, :count).by(0)
        end
      end
    end
  end

  describe 'PATCH #update' do
    context 'User does not have permission' do
      before do
        sign_in no_permission
        xhr :patch, :update, id: root_user.id
      end

      it 'sets @edit' do
        expect(assigns[:edit]).to be_falsy
      end

      it 'sets alert' do
        expect(flash[:alert]).to eq('No Permission')
      end
    end

    context 'User does have permission' do
      before do
        sign_in root_user
        xhr :patch,
            :update,
            id: root_user.id,
            user_skill_id: user_skill.id,
            user_skill: { rating: 'expert' }
      end

      it do
        expect(response).to be_success
      end

      it 'assigns @user_skills' do
        expect(assigns[:user_skill]).to eq(UserSkill.find(user_skill.id))
      end

      it 'assigns @user_skills.rating' do
        expect(assigns[:user_skill].rating).to eq('expert')
      end

      it do
        expect(response).to render_template('user_skills/update')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'User does not have permission' do
      before do
        sign_in no_permission
        xhr :delete, :destroy, id: root_user.id
      end

      it 'sets @edit' do
        expect(assigns[:edit]).to be_falsy
      end

      it 'sets alert' do
        expect(flash[:alert]).to eq('No Permission')
      end
    end

    context 'User does have permission' do
      before do
        sign_in root_user
        xhr :delete, :destroy, user_skill_id: user_skill.id, id: root_user.id
      end

      it 'delete user skill' do
        expect(UserSkill.where(user: root_user)).not_to include(user_skill)
      end

      it { expect(response).to render_template('user_skills/destroy') }
    end

    context 'invalid params' do
      before do
        sign_in root_user
        xhr :delete, :destroy, id: root_user, user_skill_id: 'lel'
      end

      it 'sets alert' do
        expect(flash[:alert]).to eq('Skill not found')
      end
    end
  end
end
