class SkillType < ActiveRecord::Base
  has_many :skills

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  before_destroy :skills?

  def skills?
    skills.count.zero?
  end
end
