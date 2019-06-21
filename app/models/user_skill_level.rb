class UserSkillLevel < ApplicationRecord
  has_one :user
  has_one :skill_level
  has_one :skill, through: :skill_level
  has_one :level, through: :skill_level
end
