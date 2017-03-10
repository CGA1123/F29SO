require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to have_many(:users) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to have_many(:project_role_locations) }

  it do
    is_expected.to have_many(:project_roles)
      .through(:project_role_locations)
  end
end
