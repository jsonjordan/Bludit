class CommentsController < ApplicationController
  before_action :set_post, except: [:edit, :update, :destroy]

  def new
    @comm = @post.comments.new(user_id: current_user.id)
    authorize @comm
  end

  def create
    @comm = @post.comments.new approved_params
    authorize @comm
    if @comm.save
      flash[:notice] = "Comment created!"
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    @comm = Comment.find params[:id]
    authorize @comm
  end

  def update
    @comm = Comment.find params[:id]
    authorize @comm
    if @comm.update approved_params
      flash[:notice] = "Comment updated!"
      redirect_to @comm.message
    else
      render :edit
    end
  end

  def destroy
    @comm = Comment.find params[:id]
    authorize @comm
    if @comm.delete
      flash[:notice] = "Post deleted!"
      redirect_to @comm.message
    else
      flash[:notice] = "Could not delete!"
      redirect_to @comm.message
    end
  end

  private

  def set_post
    @post = Message.find params[:message_id]
  end

  def approved_params
    params.require(:comment).permit(:message_id, :content, :user_id)
  end
end
