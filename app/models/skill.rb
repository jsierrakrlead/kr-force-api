class Skill < ApplicationRecord

  has_many :skill_levels, dependent: :destroy
  has_many :levels, through: :skill_levels
  has_many :users, through: :skill_levels

end
