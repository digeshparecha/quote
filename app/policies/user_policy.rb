class UserPolicy
  def initialize(user)
    @user = user
  end

  def profile_complete?
    profile_complete == 100
  end

  def profile_complete
    fields_complete.zero? ? 10 : percent_complete
  end

  def missing_profile_section
    User::PROFILE_FIELDS.select { |f| @user.__send__(f).blank? }.first
  end

  private

    def fields_complete
      Float(User::PROFILE_FIELDS.count { |f| @user.__send__(f).present? })
    end

    def percent_complete
      fields_complete / fields_total * 100.0
    end

    def fields_total
      Float(User::PROFILE_FIELDS.count)
    end
end