# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to fighter_path(comment.fighter), success: 'コメントを投稿しました'
    else
      redirect_to fighter_path(comment.fighter), danger: 'コメントを入力してください'
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy!
    redirect_to fighter_path(comment.fighter)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(fighter_id: params[:fighter_id])
  end
end
