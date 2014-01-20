class CommentsController < ApplicationController
before_filter :authenticate_user!, only: [:upvote, :downvote]
before_action :set_comment, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

def index
  @comments = Comment.all
end

def show

end

def new
  @comment = Comment.new
end

def edit

end

def create
  @c = Comment.new
  @c.content = params[:content]
  @c.user_id = params[:user_id]
  @c.post_id = params[:post_id]
  @c.submitter_id = params[:submitter_id]

  respond_to do |format|
    if @c.save
      format.html { redirect_to post_url(params[:post_id]), notice: 'Post was successfully created.' }
      format.mobile { redirect_to post_url(params[:post_id]), notice: 'Post was successfully created.' }
      format.json { render action: 'show', status: :created, location: @page }
    else
      format.html { render action: 'new' }
      format.json { render json: @c.errors, status: :unprocessable_entity }
    end
  end

  if @c.post.notification
    PostNotification.comment_notification(@c.post.user, @c.user, @c.post, @c).deliver
  end
end

def update

end

def destroy

end

def upvote
  current_user.vote_for(@comment)
  redirect_to :back
end

def downvote
  current_user.vote_against(@comment)
  redirect_to :back
end

end

private

def set_comment
  @comment = Comment.find(params[:id])
end
