require 'rails_helper'

RSpec.describe Notification, type: :model do
  it { is_expected.to belong_to(:actor).class_name('User') }
  it { is_expected.to belong_to(:recipient).class_name('User') }
  it { is_expected.to belong_to(:notifiable) }
end
