require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::BidSearch <  Resolvers::BaseResolver
  include SearchObject.module(:graphql)

  scope { Bid.all }

  type [Types::BidType], null: true

  class BidFilter < ::Types::BaseInputObject
    argument :OR, [self], required: false
    argument :name_contains, String, required: false
  end

  class BidOrderBy < ::Types::BaseEnum
    value 'createdAt_ASC'
    value 'createdAt_DESC'
  end

  option :filter, type: BidFilter, with: :apply_filter
  option :orderBy, type: BidOrderBy, default: 'createdAt_DESC'

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Bid.all
    scope = scope.where('name LIKE ?', "%#{value[:name_contains]}%") if value[:name_contains]

    branches << scope

    value[:OR].reduce(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

    branches
  end

  def apply_order_by_with_created_at_asc(scope)
    scope.order('created_at ASC')
  end

  def apply_order_by_with_created_at_desc(scope)
    scope.order('created_at DESC')
  end

end