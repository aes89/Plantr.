class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comment = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
     
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @listing_id = Listing.find(params[:id]).listing_id
    put "------------------"
    pp params
    put "------------------"

  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.author = current_user.name
    @listing = @comment.listing_id
    @listing_id = Listing.find(params[:id]).listing_id
    put "------------------"
    pp params
    put "------------------"

    respond_to do |format|
      if @comment.save
        format.html { redirect_to listings_path(@listing), notice: 'Comment was successfully created.' }
  #       format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
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
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:comment_body, :user_id, :listing_id)
    
    end
end
