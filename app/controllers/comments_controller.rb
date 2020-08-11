class CommentsController < ApplicationController
    before_action :current_user
    before_action :authenticate_user!
    before_action :set_comment, only: [:show, :edit, :update, :destroy]

    def index

    end
    
    def new
     
    end

    def show 

    end

    def create
        @listing = Listing.find(params[:listing_id])
        # @user = User.find(params[:user_id])
        # @comment = current_user.comments.create(comment_params)
        # @comments = @listing.comments.create(params[:comment].permit(:name, :body))
        @comments = @listing.comments.new(comment_params)
        @comments.user_id = current_user.id
        @comments.save
        redirect_to listing_path(@listing)
    end

    def edit
    end
        
    def update
        
    end

    def destroy
        @listing = Listing.find(params[:listing_id])
        @comment = @listing.comments.find(params[:id])
        @comment.destroy
        redirect_to listing_path(@listing)
    end

        private

    def comment_params
      params.require(:comment).permit(:body, :name)
    end

    def set_comment
 
    end
    
end