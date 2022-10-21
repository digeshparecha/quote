module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :user, Types::UserType, null: true, description: "Will return the single user detail" do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    field :bid, Types::BidType, null: true, description: "Will return the single bid detail" do
      argument :id, ID, required: true
    end
    def bid(id:)
      Bid.includes(:line_item_dates).find(id)
    end

  end
end

