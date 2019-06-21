class UserSkillLevel < ApplicationRecord
  belongs_to :user
  belongs_to :skill_level
  has_one :skill, through: :skill_level
  has_one :level, through: :skill_level
end
