class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC")
  end  

  def new
    @prototype = Prototype.new
  end
  
  def create
    @prototype = Prototype.create(prototype_params)
    unless @prototype.save
      render action: :new
    else
      redirect_to root_path
    end  
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end  

  def edit
    @prototype = Prototype.find(params[:id])
    unless current_user.id == @prototype
      redirect_to action: :index
    end
  end
  
  def update
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    unless @prototype.update(prototype_params)
      render action: :edit
    else
      render action: :show
    end  
  end  

  def destroy
    @prototype = Prototype.find(params[:id])
    if @prototype.destroy
      redirect_to root_path
    end  
  end  

    
  private 
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end  
  
  

end


