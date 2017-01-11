class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  enum rating: [basic: 0, novice: 1, intermediate: 2, advanced: 3, expert: 4]

  validates :skill_id, uniqueness: { scope: :user_id }
  validates :user, :skill, presence: true
  validates :skill_id, :rating, presence: true
end
