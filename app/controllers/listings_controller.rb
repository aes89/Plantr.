class ListingsController < ApplicationController
before_action :set_listing, only: [:show, :edit, :update, :destroy]

    def index
        @listing = Listing.all
    end
    
    def new
        @listing = Listing.new
        @material = Listing.materials.keys
        @shape = Listing.shapes.keys
        @drainage = Listing.drainages.keys
        @saucer = Listing.saucers.keys
    end

    def show
    end

    def create
        @listing = Listing.new(listing_params)
        @listing.user_id = current_user.id
        @listing.save
        byebug

        if @listing.errors.any?
            set_material
            set_shape
            set_drainage
            set_saucer
            render "new"
        else 
            redirect_to listings_path
        end 

    end
      
    def update
       
    end

    def edit
    
    end

    def destroy
        
    end

    private

    def listing_params
        params.require(:listing).permit(:title, :description, :material, :height, :width, :shape, :drainage, :saucer, :price)
    end

    def set_listing
        id = params[:id]
        @listing = Listing.find(:id)
    end

    def set_material
        @material = Listing.materials.keys
    end

    def set_shape
        @shape = Listing.shapes.keys
    end

    def set_drainage
        @drainage = Listing.drainages.keys
    end

    def set_saucer
        @saucer = Listing.saucers.keys
    end

  end
  