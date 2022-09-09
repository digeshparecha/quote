class UsersController < ApplicationController
  before_action :set_presenter, :set_user_policy, except: [:edit]
  
  def show
  end

  def edit; end

  def update
    current_user.update(user_params)
  end

  private

    def user_params
      params.require(:user).permit(:name, :bio, :age, :dob, :phone, :country, :city, :zip, :address)
    end
    
    def set_presenter
      @user_presenter = UserPresenter.new(current_user)
    end
    
    def set_user_policy
      @user_policy = UserPolicy.new(current_user)
    end
end