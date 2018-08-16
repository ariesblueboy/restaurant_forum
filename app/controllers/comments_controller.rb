class CommentsController < ApplicationController
  def creat
    @restaurant = Restaurant.find(params[:restaurant_id]) 
    @comment = @restaurant.comment.build(comment_params) 
    @comment.user = current_user
    @commet.save!
    redirect_to restaurant_path(@restaurant)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
