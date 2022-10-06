class UserPresenter
  def initialize(user)
    @user = user
  end

  def details
    {
      "Name": @user.name,
      "Age": @user.age,
      "Country": @user.country,
      "Address": AddressValue.new(@user).full_address,
      "Email": @user.email,
      "About You": @user.bio
    }
  end

end