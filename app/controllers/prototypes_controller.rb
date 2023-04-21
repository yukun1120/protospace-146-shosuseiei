class PrototypesController < ApplicationController
  def new
    @prototype = Prototype.new
  end

  def create
    if Prototype.create(post_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    
  end
end
