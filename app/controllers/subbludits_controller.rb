class SubbluditsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @subs = Subbludit.all
  end

  def new
  end

  def create
    @sub = Subbludit.new(name: params[:subbludits][:name])
    if @sub.save
      flash[:notice] = "Subbludit created!"
      redirect_to @sub
    else
      render :new
    end
  end

  def show
    @sub = Subbludit.find params[:id]
  end

end
