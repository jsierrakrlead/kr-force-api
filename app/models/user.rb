class User < ApplicationRecord
  has_many :user_skill_levels, dependent: :destroy
  has_many :skills, through: :user_skill_levels
  has_many :levels, through: :user_skill_levels
end
