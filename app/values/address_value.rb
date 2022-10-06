class AddressValue
  def initialize(user)
    @user = user
  end

  def full_address
    "#{@user.address}, #{@user.city} - #{@user.zip}"
  end
end