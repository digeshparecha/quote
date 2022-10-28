module Types
  class MutationType < Types::BaseObject
   
    field :create_bid, mutation: Mutations::CreateBid 
    
  end
end
