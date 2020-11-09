class CommentsController < ApplicationController

  before_action :set_comment, only: [:update, :destory, :restory]
  before_action :check_user, only: [:update, :destory, :restory]


  def create
    @comment = Comment.new(comment_params)
    @seller_of_item = User.find(@comment.item.seller_id)
    @comment.save
    redirect_to item_path(@comment.item.id)
  end

  def update
    # @comment = Comment.find(params[id])
    @comment.update(delete_check:1)
    redirect_to item_path(@comment.item.id)
  end

  def restore
    # @comment = Comment.find(params[:id])
    @comment.update(delete_check:0)
    redirect_to item_path(@comment.item.id)

  end

  def destroy
    # @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to item_path(@comment.item.id)
  end


end



private
  def comment_params
    params.require(:comment).permit(:comment, :item_id,).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_user
    unless @comment.item.seller == current_user
      flash[:alert] = "操作は出来ません"
      redirect_to root_path
    end
  end
end