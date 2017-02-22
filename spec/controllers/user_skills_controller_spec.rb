require 'rails_helper'

RSpec.describe UserSkillsController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:user_skill) { FactoryGirl.create(:user_skill, user: root_user) }
  let(:skill) { FactoryGirl.create(:skill) }
  let(:skill_type) do
    SkillType.new(id: 0, name: 'All Skills', description: 'Get all skills')
  end

  describe 'GET #index' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get,
            action: :index,
            params: { id: no_permission.id } }
        end
      end
    end

    context 'User does have permission' do
      before do
        sign_in root_user
        get :index, id: root_user.id
      end

      it do
        expect(response).to be_success
      end

      it 'assigns @user_skills' do
        expect(assigns[:user_skills]).to eq(UserSkill.where(user: root_user))
      end

      it 'assigns @skill_types' do
        expect(assigns[:skill_types]).to eq(SkillType.all)
      end

      it 'assigns @skill_types with only said type' do
        expect(assigns[:skill_types]).to eq(SkillType.all.unshift(skill_type))
      end
    end
  end

  describe 'POST #create' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post,
            action: :create,
            params: { id: no_permission.id } }
        end
      end
    end

    context 'User does have permission' do
      before { sign_in root_user }

      context 'valid params' do
        let(:params) do
          { user_skill: { skill_id: skill.id,
                          rating: 1 },
            id: root_user.id }
        end

        it 'creates a new user skill' do
          expect { post :create, params }.to change(UserSkill, :count).by(1)
        end

        it do
          post :create, params
          expect(response).to redirect_to(user_skills_path(id: root_user.id))
        end
      end

      context 'invalid params' do
        let(:params) do
          { user_skill: { skill_id: -1,
                          rating: -1 },
            id: root_user.id }
        end

        it 'does not create a new group' do
          expect { post :create, params }.to change(UserSkill, :count).by(0)
        end

        it do
          post :create, params
          expect(response).to redirect_to(user_skills_path(id: root_user.id))
        end
      end
    end
  end

  describe 'GET #edit' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :get,
            action: :edit,
            params: { id: no_permission.id } }
        end
      end
    end

    context 'User does have permission' do
      before do
        sign_in root_user
        xhr :get, :edit, id: root_user.id, user_skill_id: user_skill.id
      end

      it do
        expect(response).to be_success
      end

      it 'assigns @user_skills' do
        expect(assigns[:user_skill]).to eq(UserSkill.find(user_skill.id))
      end

      it do
        expect(response).to render_template('user_skills/edit')
      end
    end
  end

  describe 'PATCH #update' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :patch,
            action: :update,
            params: { id: no_permission.id } }
        end
      end
    end

    context 'User does have permission' do
      before do
        sign_in root_user
        xhr :patch,
            :update,
            id: root_user.id,
            user_skill_id: user_skill.id,
            user_skill: { rating: 1 }
      end

      it do
        expect(response).to be_success
      end

      it 'assigns @user_skills' do
        expect(assigns[:user_skill]).to eq(UserSkill.find(user_skill.id))
      end

      it 'assigns @user_skills.rating' do
        expect(assigns[:user_skill].rating).to eq('novice')
      end

      it do
        expect(response).to render_template('user_skills/update')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :delete,
            action: :destroy,
            params: { id: no_permission.id } }
        end
      end
    end

    context 'User does have permission' do
      before do
        sign_in root_user
        delete :destroy, user_skill_id: user_skill.id, id: root_user.id
      end

      it 'delete user skill' do
        expect(UserSkill.where(user: root_user)).not_to include(user_skill)
      end

      it { expect(response).to redirect_to(user_skills_path(id: root_user.id)) }
    end
  end

  describe 'POST #search' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission' do
        let(:req) do
          { method: :post, action: :search, params: { id: no_permission.id } }
        end
      end
    end

    context 'User does have permission' do
      before { sign_in root_user }

      context 'empty search string' do
        before { xhr :post, :search, id: root_user.id, skill_name: '' }
        it 'sets @skills to nil' do
          expect(assigns[:skills]).to be_nil
        end
      end

      context 'non empty search string' do
        before do
          xhr :post,
              :search,
              id: root_user.id,
              skill_name: skill.name,
              skill_type_id: '0'
        end

        it 'finds a skill mofos' do
          expect(assigns[:skills]).to include(skill)
        end

        it 'assigns @type' do
          expect(assigns[:type]).to eq('0')
        end
      end
    end
  end
end
