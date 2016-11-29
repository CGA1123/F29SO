require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def after_sign_in_path_for(resource)
      super resource
    end
  end

  describe '#after_sign_in_path_for' do
    it 'returns root path' do
      u = FactoryGirl.build(:user)
      expect(controller.after_sign_in_path_for(u)).to eq authenticated_root_path
    end
  end
end
