class Skill < ApplicationRecord

  has_many :skill_levels, dependent: :destroy
  has_many :user_skill_levels, through: :skill_levels
  has_many :levels, through: :skill_levels
  has_many :users, through: :skill_levels
  has_many :tags, as: :taggable

end
