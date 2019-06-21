# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'database_cleaner'
require 'faker'

DatabaseCleaner.clean_with(:truncation)


yn = Level.create!(name: "Youngling/Initiate", weight: 0, description: "Little to no knowledge of this skill.")
pad = Level.create!(name: "Padawan", weight: 1, description: "Beginner's knowledge. Starting to learn it with maybe some pet projects")
kn = Level.create!(name: "Knight", weight: 2, description: "Applied concepts of the skill in complete projects; can explain common errors and patterns to others")
mas = Level.create!(name: "Master", weight: 3, description: "Proficient in understanding and implemenation of the skill in different contexts; can teach its fundamental concepts to others and understands all limitations of a project implementing the skill.")
gm = Level.create!(name: "Grand Master", weight: 4, description: "Very experienced in this field; generally contributes to the understanding and implementation of this skill at a broad level")
sl = Level.create!(name: "Sith Lord", weight: 5, description: "Can use (or has used) this skill to take over the world!")

total_levels = [yn, pad, kn, mas, gm, sl]

(1..20).each do |n|
  u = User.create!(email: Faker::Internet.unique.email, name: Faker::Name.unique.name_with_middle)
  s = Skill.find_or_create_by!(name: Faker::Job.key_skill)
  !s[:description] && s.update!(description: Faker::Lorem.paragraph(4))

  skl = SkillLevel.create!({
    level: total_levels[rand(total_levels.length)],
    skill: s
  })
  UserSkillLevel.create!({
    user: u,
    skill_level: skl
  })
end
