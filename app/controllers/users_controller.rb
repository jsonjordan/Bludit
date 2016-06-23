class UsersController < ApplicationController
  before_action :set_user, except: [:destroy, :index, :edit]

  def show
    authorize @user
  end

  def index
    @users = User.all
  end

  def edit
    raise
  end

  def update
    authorize @user
    if @user.update approved_params
      flash[:notice] = "Screen name updated!"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find params[:id]
    authorize @user
    if @user.delete
      flash[:notice] = "User deleted!"
      render :index
    else
      flash[:notice] = "Could not delete User!"
      render :index
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
