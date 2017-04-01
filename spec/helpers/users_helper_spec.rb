require 'spec_helper'

RSpec.describe UsersHelper, type: :helper do
  let(:user) { FactoryGirl.build(:user) }
  describe '#user_avatar' do
    it 'returns img tag' do
      expect(helper.user_avatar(user)).to \
        match(%r{<img\sdata-name="\w\w"\sdata-height="60"\sdata-width="60"\s
        data-seed="\d\d?"\sdata-char-count="2"\sdata-font-size="30"\sclass="
        profile-img"\ssrc=""\s/>}x)
    end
  end
end
