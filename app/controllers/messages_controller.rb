class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sub, except: [:destroy, :new, :edit, :update]


  def new
    @sub = Subbludit.find params[:subbludit_id]
    @post = @sub.messages.new
  end

  def create
    @post = @sub.messages.new approved_params
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to @sub
    else
      render :new
    end
  end

  def edit
    @post = current_user.messages.find(params[:id])
    @sub = @post.subbludit
  end

  def update
    @post = current_user.messages.find(params[:id])
    if @post.update approved_params
      flash[:notice] = "Post updated!"
      redirect_to @post.subbludit
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.messages.find(params[:id])
    if @post.delete
      flash[:notice] = "Post deleted!"
      redirect_to @post.subbludit
    else
      render "subbludit/show"
    end
  end


  private

  def set_sub
    @sub = Subbludit.find params[:message][:subbludit_id]
  end

  def approved_params
    if params[:messages]
      params.require(:messages).permit(:title, :content, :user_id)
    else
      params.require(:message).permit(:title, :content, :user_id)
    end
  end
end
