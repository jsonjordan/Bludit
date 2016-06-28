class MessagesController < ApplicationController
  before_action :set_sub, except: [:destroy, :new, :edit, :update, :show, :upvote, :downvote]

  def upvote
    @post = Message.find(params[:id])
    authorize current_user
    @post.upvote_by current_user
    redirect_to message_path(@post)
  end

  def downvote
    @post = Message.find(params[:id])
    authorize current_user
    @post.downvote_by current_user
    redirect_to message_path(@post)
  end

  def new
    @sub = Subbludit.find params[:subbludit_id]
    @post = @sub.messages.new user_id: current_user.id
    authorize @post
  end

  def create
    @post = @sub.messages.new approved_params
    authorize @post
    if @post.save
      flash[:notice] = "Post created!"
      redirect_to @sub
    else
      render :new
    end
  end

  def edit
    @post = Message.find(params[:id])
    @sub = @post.subbludit
    authorize @post
  end

  def update
    @post = Message.find(params[:id])
    authorize @post
    if @post.update approved_params
      flash[:notice] = "Post updated!"
      redirect_to @post.subbludit
    else
      render :edit
    end
  end

  def destroy
    @post = Message.find(params[:id])
    authorize @post
    if @post.delete
      flash[:notice] = "Post deleted!"
      redirect_to @post.subbludit
    else
      render "subbludit/show"
    end
  end

  def show
    @post = Message.find(params[:id])
    authorize @post
  end


  private

  def set_sub
    @sub = Subbludit.find params[:message][:subbludit_id]
  end

  def approved_params
    params.require(:message).permit(:title, :content, :user_id)
  end
end
