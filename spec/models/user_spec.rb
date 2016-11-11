require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:user_groups) }
  it { should have_many(:groups).through(:user_groups) }
end
