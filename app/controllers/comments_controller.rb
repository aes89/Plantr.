class CommentsController < ApplicationController
  
    before_action :set_comment, only: [:show, :edit, :update, :destroy]

    def index

    end
    
    def new
     
    end

    def show 
    end

    def create
        @listing = Listing.find(params[:listing_id])
        @comments = @listing.comments.create(params[:comment].permit(:name, :body))
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
      
    end

    def set_comment
 
    end
    
end