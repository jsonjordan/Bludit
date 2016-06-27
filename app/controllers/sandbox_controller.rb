class SandboxController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def votes
    @count = 5
  end
end
