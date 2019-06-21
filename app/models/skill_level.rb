class SkillLevel < ApplicationRecord
  belongs_to :skill
  belongs_to :level
  has_many :user_skill_levels, dependent: :destroy
  has_many :users, through: :skill_levels
end
