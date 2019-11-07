# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: [:upvote, :downvote]
  before_action :set_post, only: [:edit, :create, :update, :destroy, :upvote, :downvote]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.find(params[:id])
  end

  # GET /comments/1/edit
  def edit
    @comment = @post.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_post_path(current_user, @post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to user_post_path(current_user, @post), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if current_user.id == @comment.user_id
        @comment.destroy
        format.html { redirect_to user_post_path(current_user, @post) }
        format.json { head :no_content }
      else
        format.html { redirect_to user_post_path(current_user, @post), notice: 'You are not allowed to Delete'  }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def upvote
    @comment.upvote_by current_user
    respond_to do |format|
      format.html { redirect_to user_post_path(current_user, @post) }
    end
  end

  def downvote
    @comment.downvote_by current_user
    respond_to do |format|
      format.html { redirect_to user_post_path(current_user, @post) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:commenter, :description)
  end
end
