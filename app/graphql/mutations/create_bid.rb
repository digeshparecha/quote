class Mutations::CreateBid < GraphQL::Schema::Mutation
  null true

  argument :name, String, required: true

  type Types::BidType

  def resolve(name:)
    context[:current_company].bids.create!(name: name)
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end