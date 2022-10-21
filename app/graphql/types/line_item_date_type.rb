class Types::LineItemDateType < Types::BaseObject

  description "return line item"

  field :id, ID, null: false 
  field :bid_id, ID, null: false
  field :date , GraphQL::Types::ISO8601Date, null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  
end