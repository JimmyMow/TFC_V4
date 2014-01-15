class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :upvote, :downvote]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  # GET /posts
  # GET /posts.json
  def index
    if params[:search]
      @posts = Post.where("title LIKE ?", "%#{params[:search]}%")
    elsif params[:new_post]
      @posts = Post.order('created_at DESC').page(params[:page]).per(5)
    else
      @posts = Post.all.sort_by { |p| p.votes_for }.reverse.slice(0, 10)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @page }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    current_user.vote_for(@post)
    redirect_to :back
  end

  def downvote
    current_user.vote_against(@post)
    redirect_to :back
  end

  def tweet
    current_user.twitter.update("#{params[:message]} via @FansChallenge")
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :url, :user_id, :category_id, :submitter_id, :notification)
    end
end
