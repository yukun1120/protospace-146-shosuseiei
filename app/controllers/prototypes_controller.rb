class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.includes(:user)
  end
  
  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :edit
    end
  end
  def show
    @prototype = Prototype.find(params[:id])
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if user_signed_in?
      prototype.destroy
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
    
  end
  

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

end
