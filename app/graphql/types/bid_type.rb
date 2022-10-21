class Types::BidType < Types::BaseObject

  description "Detail of Bid"

  field :id, ID, null: false 
  field :name, String, null: false
  field :company_id, Int, null:false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :line_item_dates, [Types::LineItemDateType], null: false

end