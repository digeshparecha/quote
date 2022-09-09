class UserPresenter
  def initialize(user)
    @user = user
  end

  def details
    {
      "Name": @user.name,
      "Age": @user.age,
      "Country": @user.country,
      "Address": "#{@user.address}, #{@user.city} - #{@user.zip}",
      "Email": @user.email,
      "About You": @user.bio
    }
  end

end