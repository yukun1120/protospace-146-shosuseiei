class PrototypesController < ApplicationController
  def new
    @prototype = Prototype.new
  end

  def create
    Prototype.create(post_params)
  end

  private
  def post_params
    params.require(:post).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    redirect_to root_path
  end
end
