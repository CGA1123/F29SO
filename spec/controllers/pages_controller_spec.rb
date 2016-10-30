require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #user_home" do
    it do
      get :user_home
      expect(response).to be_success
    end
  end

end
