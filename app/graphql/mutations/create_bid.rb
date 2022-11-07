class Mutations::CreateBid < GraphQL::Schema::Mutation
  null true

  argument :bid_attributes, Types::BidAttributes
  
  type Types::BidType

  def resolve(bid_attributes:)
    context[:current_company].bids.create!(name: bid_attributes.name)
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end