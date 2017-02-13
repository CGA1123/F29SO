require 'rails_helper'

RSpec.describe UserSkillsController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:no_perm_id) { no_permission.id }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:user_skill) { FactoryGirl.create(:user_skill) }
  let(:skill_type) { FactoryGirl.create(:skill_type) }
  let(:user_skill) { FactoryGirl.create(:user_skill) }

  describe 'GET #index' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission', method: :get,
                                       action: :index,
                                       params: { id: no_perm_id }
    end

    context 'User does have permission' do
      before do
        sign_in root_user
        get :index
      end

      it do
        expect(response).to be_success
      end

      it 'assigns @user_skills' do
        expect(assigns[:user_skill]).to eq(UserSkill.where(user: root_user))
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
      it_behaves_like 'no permission', method: :post,
                                       action: :create,
                                       params: { id: no_perm_id }
    end

    context 'User does have permission' do
      before { sign_in root_user }

      context 'valid params' do
        let(:params) do
          { user_skill: { user: :root_user,
                          skill: :skill_type,
                          rating: 'novice' } }
        end

        it 'creates a new user skill' do
          expect { post :create, params }.to change(UserSkill, :count).by(1)
        end

        it do
          post :create, params
          expect(response).to redirect_to(:index)
        end
      end

      context 'invalid params' do
        let(:params) { { group: { user: :root_user } } }

        it 'does not create a new group' do
          expect { post :create, params }.to change(UserSkill, :count).by(0)
        end

        it do
          post :create, params
          expect(response).to redirect_to(:index)
        end
      end
    end
  end

  describe 'GET #edit' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission', method: :get,
                                       action: :edit,
                                       params: { id: no_perm_id }
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
        expect(response).to render_template('user_skills/edit.js.erb')
      end
    end
  end

  describe 'PATCH #update' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission', method: :patch,
                                       action: :update,
                                       params: { id: no_perm_id }
    end

    context 'User does have permission' do
      before do
        sign_in root_user
        xhr :patch, :update, id: root_user.id, user_skill_id: user_skill.id
      end

      it do
        expect(response).to be_success
      end

      it 'assigns @user_skills' do
        expect(assigns[:user_skill]).to eq(UserSkill.find(user_skill.id))
      end

      it 'assigns @user_skills.rating' do
        expect(assigns[:user_skill].rating).to eq(:novice)
      end

      it do
        expect(response).to render_template('user_skills/update.js.erb')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission', method: :delete,
                                       action: :destroy,
                                       params: { id: no_perm_id }
    end

    context 'User does have permission' do
      before { sign_in root_user }

      it 'delete user skill' do
        expect { delete :destroy, name: user_skill }
          .to change(UserSkill, :count).by(-1)
      end

      it do
        delete :destroy, name: user_skill
        expect(response).to redirect_to(user_skills_path)
      end
    end
  end

  describe 'POST #search' do
    context 'User does not have permission' do
      before { sign_in no_permission }
      it_behaves_like 'no permission', method: :post,
                                       action: :search,
                                       params: { id: no_perm_id }
    end

    context 'User does have permission' do
      before { sign_in root_user }

      it do
        expect(response).to be_success
      end

      it 'assigns @search_string' do
        expect(assigns[:search_string]).to eq('skill')
      end

      it 'assigns @skill_type' do
        expect(assigns[:skill_types]).to eq(1)
      end

      it 'assigns @skills' do
        expect(assigns[:skills]).to eq(Skill.all)
      end

      it 'assigns @skills with only @search_string' do
        expect(assigns[:skills]).to eq(skills.where('lower(name) LIKE ?',
                                                    search_string))
      end
    end
  end
end
