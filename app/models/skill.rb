class Skill < ActiveRecord::Base
  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
