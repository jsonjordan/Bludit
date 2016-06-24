class ModeratorsController < ApplicationController

  def index
    @mods = Moderator.order(:subbludit_id)
    authorize @mods
  end

  def new
    @sub = Subbludit.find params[:subbludit][:subbludit_id]
    @mod = @sub.moderators.new
    authorize @mod
  end

  def create
    @user = User.find_by(name: params[:moderator][:user])
    if @user.nil?
      flash[:alert] = "No user by that name!"
      redirect_to :back
    else
      @mod = Moderator.new(subbludit_id: params[:moderator][:subbludit_id], user_id: @user.id)
      authorize @mod
      if @mod.save
        flash[:notice] = "Moderator assigned!"
        redirect_to @mod.subbludit
      else
        render :new
      end
    end
  end

  def destroy
    @mod = Moderator.find params[:id]
    authorize @mod
    if @mod.delete
      flash[:notice] = "Moderator unassigned!"
      redirect_to moderators_path
    else
      flash[:notice] = "Moderator not unassigned!"
      redirect_to moderators_path
    end
  end

  private

  def approved_params
    params.require(:moderator).permit(:user, :subbludit_id)
  end

end
