class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  enum rating: { basic: 0, novice: 1, intermediate: 2, advanced: 3, expert: 4 }

  validates :user_id, uniqueness: { scope: :skill_id }
  validates :user, :skill, :rating, presence: true
end
