require 'rails_helper'

RSpec.describe UserSkill, type: :model do
  it_behaves_like 'join table', :skill, :user
end
