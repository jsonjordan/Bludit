class SubbluditsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @subs = Subbludit.all
    authorize @subs
  end

  def new
    @sub = Subbludit.new
    authorize @sub
  end

  def create
    @sub = Subbludit.new(name: params[:subbludit][:name])
    authorize @sub
    if @sub.save
      Moderator.create!(subbludit_id: @sub.id, user_id: current_user.id)
      flash[:notice] = "Subbludit created!"
      redirect_to @sub
    else
      render :new
    end
  end

  def show
    @sub = Subbludit.find params[:id]
    authorize @sub
  end

  def edit
    @sub = Subbludit.find params[:id]
    authorize @sub
  end

  def update
    @sub = Subbludit.find params[:id]
    authorize @sub
    if @sub.update approved_params
      flash[:notice] = "Subbludit was updated!"
      redirect_to subbludits_path
    else
      render :edit
    end
  end

  def destroy
    @sub = Subbludit.find params[:id]
    authorize @sub
    if @sub.delete
      flash[:notice] = "Subbludit deleted!"
      redirect_to subbludits_path
    else
      flash[:notice] = "Could not delete Subbludit!"
      redirect_to subbludits_path
    end
  end

  private

  def approved_params
    params.require(:subbludit).permit(:name)
  end

end
