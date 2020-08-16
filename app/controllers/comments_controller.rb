class CommentsController < ApplicationController
    #all comments/associated actions must be authenticated through Devise gem. 
    before_action :current_user
    before_action :authenticate_user!

    def index

    end
    
    def new
     
    end

    def show 

    end

    # to create comment on a specific listing id and refresh listing page with new comment displayed
    def create
        @listing = Listing.find(params[:listing_id])
        @comments = @listing.comments.new(comment_params)
        @comments.user_id = current_user.id
        @comments.save
        redirect_to listing_path(@listing)
    end

    #comments cannot be edited as they are enquiries on purchases.
    def edit

    end
        
    def update
        
    end

    #comments only to be deleted/removed from Comment table by listing owner, no the comment author. "Delete" button on view only shown to correct user.
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

    
end