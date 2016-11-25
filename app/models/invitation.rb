class Invitation < ActiveRecord::Base
  validates :email, :token, :sent_at, presence: true
end
