require 'rails_helper'

RSpec.describe ProjectAnnouncement, type: :model do
  it_behaves_like 'join table', :projects, :announcements
end
