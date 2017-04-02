require 'rails_helper'

RSpec.describe NotificationsHelper, type: :helper do
  let(:notification) do
    FactoryGirl.create(:notification, action: 'system_announcement')
  end

  describe '#notification_path_helper' do
    it 'returns a path' do
      expect(notification_path_helper(notification)).not_to be_nil
    end
  end

  describe '#notification_message_helper' do
    it 'not nil' do
      expect(notification_message_helper(notification)).not_to be_nil
    end
  end
end
