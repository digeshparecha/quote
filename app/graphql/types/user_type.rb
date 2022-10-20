class Types::UserType < Types::BaseObject

  description "One user"

  field :id , ID, null: false
  field :email, String, null: false
  field :address, String, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false

  def address
    AddressValue.new(object).full_address
  end

end