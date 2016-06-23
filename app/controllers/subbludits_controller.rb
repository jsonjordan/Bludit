class SubbluditsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @subs = Subbludit.all
  end

  def new
    @sub = Subbludit.new
  end

  def create
    @sub = Subbludit.new(name: params[:subbludit][:name])
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
