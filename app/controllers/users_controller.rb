class UsersController < ApplicationController
  def create
    @user = User.new(user_pramas)
    if @user.save
      redirect_to root_path, notice: "Please check your email for confirmation instructions"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new
  end

  private

  def user_pramas
    pramas.require(:user).permit(:email, :password, :password_confirmation)
  end
end
