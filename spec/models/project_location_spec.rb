require 'rails_helper'

RSpec.describe ProjectLocation, type: :model do
  it_behaves_like 'join table', :project, :location
end
