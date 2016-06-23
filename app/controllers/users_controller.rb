class UsersController < ApplicationController
  before_action :authenticate_user!, :set_user

  def show
  end

  def edit
  end

  def update
    if @user.update approved_params
      flash[:notice] = "Screen name updated!"
      redirect_to @user
    else
      render :edit
    end
  end

  def picture
    flash[:notice] = "HAHAHAHA, I cant do that yet!"
    redirect_to @user
  end


  private

  def set_user
    @user = current_user
  end

  def approved_params
    params.require(:user).permit(:name)
  end
end
