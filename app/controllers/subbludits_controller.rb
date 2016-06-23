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

end
