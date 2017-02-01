class Location < ActiveRecord::Base
  has_many :users

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
