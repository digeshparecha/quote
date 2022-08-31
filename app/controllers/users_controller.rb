class UsersController < ApplicationController

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
  
end