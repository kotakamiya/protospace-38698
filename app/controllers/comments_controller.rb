class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    redirect_to "/prototypes/#{@comment.prototype.id}"
  end  
  
  def show 
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :prototype_id).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end  

end
