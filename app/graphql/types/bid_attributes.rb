class Types::BidAttributes < Types::BaseInputObject
  description "Attributes for creating Bid"
  argument :name, String, required: true
end