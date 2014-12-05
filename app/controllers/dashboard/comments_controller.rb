class Dashboard::CommentsController < ApplicationController
  before_action :set_dashboard_comment, only: [:show, :edit, :update, :destroy]

  # GET /dashboard/comments
  # GET /dashboard/comments.json
  def index
    @dashboard_comments = Dashboard::Comment.all
  end

  # GET /dashboard/comments/1
  # GET /dashboard/comments/1.json
  def show
    respond_to do |format|
      	format.js {@dashboard_comment}
    end
  end

  # GET /dashboard/comments/new
  def new
    @dashboard_comment = Dashboard::Comment.new
  end

  # GET /dashboard/comments/1/edit
  def edit
  end

  # POST /dashboard/comments
  # POST /dashboard/comments.json
  def create
    @dashboard_comment = Dashboard::Comment.new(dashboard_comment_params)

    respond_to do |format|
      if @dashboard_comment.save
        flash[:nostice] = 'Comment was successfully created.'
        format.html { redirect_to @dashboard_comment }
        format.json { render action: 'show', status: :created, location: @dashboard_comment }
        format.js {@dashboard_comment = Dashboard::Comment.where('article_id = ?',params[:dashboard_comment][:article_id]).last}
      else
        format.html { render action: 'new' }
        format.json { render json: @dashboard_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_reply_comment
    reply_comment = Dashboard::ReplyComment.create(body: params[:body_reply], comment_id: params[:comment_id])
    reply_comment.save

    respond_to do |format|
      format.js { @reply_comments =  Dashboard::ReplyComment.where("comment_id = ?", reply_comment.comment_id).last }
    end
  end

  # PATCH/PUT /dashboard/comments/1
  # PATCH/PUT /dashboard/comments/1.json
  def update
    respond_to do |format|
      if @dashboard_comment.update(dashboard_comment_params)
        format.html { redirect_to @dashboard_comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dashboard_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/comments/1
  # DELETE /dashboard/comments/1.json
  def destroy
    @dashboard_comment.destroy
    reply_comment = Dashboard::ReplyComment.find_by_comment_id(params[:id])
    reply_comment.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_comments_url }
      format.json { head :no_content }
      format.js
      flash[:notice] = 'Comment was successfully deleted.'
    end
  end

  def destroy_reply
    reply_comment = Dashboard::ReplyComment.find(params[:comment_id])
    reply_comment.destroy
<<<<<<< HEAD

    respond_to do |format|
      format.json { head :no_content }
=======
    respond_to do |format|
      format.js
>>>>>>> 6ae2c9af0e53d1bd0f7f6f3786317fc15b991ded
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard_comment
      @dashboard_comment = Dashboard::Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_comment_params
      params.require(:dashboard_comment).permit(:article_id, :name, :email, :body, :profile)
    end
end
