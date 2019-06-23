require 'search_object/plugin/graphql'

class Resolvers::SkillsSearch
  include SearchObject.module(:graphql)
  # scope is starting point for search
  scope { Skill.all }

  type types[Types::SkillType]

  # inline input type definition for the advance filter
  class SkillFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :name_contains, String, required: false
    argument :description_contains, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: SkillFilter, with: :apply_filter

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Skill.all
    scope = scope.where("lower(description) LIKE ? ", "%#{value[:description_contains].downcase.strip}%") if value[:description_contains]
    scope = scope.where("lower(name) LIKE ? ", "%#{value[:name_contains].downcase.strip}%") if value[:name_contains]

    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end






end
