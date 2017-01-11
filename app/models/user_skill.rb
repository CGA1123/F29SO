class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  validates :skill_id, uniqueness: { scope: :user_id }
  validates :user, :skill, presence: true
end
