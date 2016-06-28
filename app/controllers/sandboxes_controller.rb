class SandboxesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized


  def votes

  end

  def votecount
    sb = Sandbox.first
    respond_to do |format|
      format.html { @count = sb.score }
      format.json { render json: { status: :ok, count: sb.score } }
    end
  end

  def upvote
    sb = Sandbox.first
    sb.upvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back}
      format.json { render json: { status: :ok } }
    end
  end

  def downvote
    sb = Sandbox.first
    sb.downvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back}
      format.json { render json: { status: :ok } }
    end
  end

  def reset
    # sb = Sandbox.first
    # act as votable doesnt have a reset function
    # looking for a work around
    message = "Not implemented yet"
    respond_to do |format|
      format.html { redirect_to :back, notice: message}
      format.json { render json: { status: :ok, message: message } }
    end
  end
end
