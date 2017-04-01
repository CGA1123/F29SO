require 'rails_helper'

RSpec.describe SkillTypesController, type: :controller do
  let(:no_permission) { FactoryGirl.create(:user) }
  let(:root_user) { FactoryGirl.create(:root_user) }
  let(:skill_type) { FactoryGirl.create(:skill_type) }

  describe 'POST #create' do
    context 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) { { method: :post, action: :create, params: {}, xhr: true } }
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      it do
        xhr :post, :create, skill_type: { name: 'test', description: 'test' }
        expect(response).to be_success
      end

      context 'valid params' do
        before do
          xhr :post, :create, skill_type: { name: 'test', description: 't' }
        end

        it 'creates a skill type' do
          expect(SkillType.find_by(name: 'test')).to be_present
        end

        it do
          expect(response).to render_template('skill_types/create')
        end
      end

      context 'invalid params' do
        before do
          xhr :post, :create, skill_type: { name: 'test', description: '' }
        end

        it 'does not creates a skill type' do
          expect(SkillType.find_by(name: 'test')).to be_nil
        end

        it do
          expect(response).to render_template('skill_types/create')
        end
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) do
          { method: :delete, action: :destroy, params: {}, xhr: true }
        end
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before { xhr :delete, :destroy, id: skill_type.id }

        it { expect(response).to be_success }

        it 'deletes skill type' do
          expect(SkillType.find_by(id: skill_type.id)).to be_nil
        end

        it { expect(response).to render_template('skill_types/destroy') }
      end

      context 'invalid params' do
        before { xhr :delete, :destroy, id: 'breh' }

        it 'does not delete skill type' do
          expect(SkillType.find_by(id: skill_type.id)).to be_present
        end

        it { expect(response.location).to eq(skill_types_url) }
      end
    end
  end

  describe 'PATCH #update' do
    context 'no permission' do
      before { sign_in no_permission }

      it_behaves_like 'no permission' do
        let(:req) do
          { method: :patch, action: :update, params: { id: 'id' }, xhr: true }
        end
      end
    end

    context 'has permission' do
      before { sign_in root_user }

      context 'valid params' do
        before do
          xhr :patch, :update, id: skill_type.id, skill_type: { name: 'up' }
        end

        it 'succeeds update' do
          expect(assigns[:update_success]).to be(true)
        end

        it 'updates' do
          expect(SkillType.find(skill_type.id).name).to eq('up')
        end
      end

      context 'invalid params' do
        before do
          xhr :patch, :update, id: skill_type.id, skill_type: { name: '' }
        end

        it { expect(response).to be_success }

        it 'fails update' do
          expect(assigns[:update_success]).to be(false)
        end

        it 'does not update' do
          expect(SkillType.find(skill_type.id).name).not_to eq('')
        end
      end

      context 'skill type not found' do
        before { xhr :patch, :update, id: 'breh' }

        it { expect(response).to be_success }
      end
    end
  end
end
