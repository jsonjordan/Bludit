class UsersController < ApplicationController
  before_action :set_user, except: [:destroy, :index, :edit, :update]

  def show
    authorize @user
  end

  def index
    @users = User.all
    authorize @users
  end

  def edit
    @user = User.find params[:id]
    authorize @user
  end

  def update
    @user = User.find params[:id]
    authorize @user
    if @user.update approved_params
      flash[:notice] = "User was updated!"
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find params[:id]
    authorize @user
    if @user.delete
      flash[:notice] = "User deleted!"
      redirect_to users_path
    else
      flash[:notice] = "Could not delete User!"
      redirect_to users_path
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
    params.require(:user).permit(:name, :email, :permission)
  end
end
