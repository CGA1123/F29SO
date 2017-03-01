require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the NotificationsHelper. For example:
#
# describe NotificationsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe NotificationsHelper, type: :helper do
  let(:notification) { FactoryGirl.create(:notification) }

  describe '#notification_path_helper' do
    it 'returns nil' do
      expect(notification_path_helper(notification)).to be_nil
    end
  end

  describe '#notification_message_helper' do
    it 'is not yet implemented' do
      expect(notification_message_helper(notification))
        .to eq 'Not yet implemented. ' \
               'See NotificationsHelper#notification_message_helper'
    end
  end
end
