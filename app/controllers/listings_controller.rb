class ListingsController < ApplicationController
before_action :set_listing, only: [:show, :edit, :update, :destroy]
before_action :set_drainage, :set_material, :set_saucer, :set_shape, only: [:new, :edit, :update]

    def index
        @listing = Listing.all
    end
    
    def new
        @listing = Listing.new
        
    end

    def show
    end

    def create
        @listing = current_user.listings.create(listing_params)

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

    def edit
       
    end
      
    def update
        @listing.user_id = current_user.id
        @listing.save
        if @listing.update(listing_params)
            redirect_to listings_path
        else    
            set_material
            set_shape
            set_drainage
            set_saucer
            render "new"
        end
    end

    def destroy
        @listing.destroy
        redirect_to listings_path
    end

        private

    def listing_params
        params.require(:listing).permit(:title, :description, :material, :height, :width, :shape, :drainage, :saucer, :price, :picture)
    end

    def set_listing
        # @listing = Listing.find(params[:id])
        id = params[:id]
        @listing = Listing.find(id)
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
  