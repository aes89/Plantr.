class ListingsController < ApplicationController
before_action :set_listing, only: [:show, :edit, :update, :destroy]
before_action :set_drainage, :set_material, :set_saucer, :set_shape, only: [:new, :edit, :update]

    def index
        @listing = Listing.all
    end


    def show
        @comment = Comment.new
        @comments = @listing.comments.all   
        # @comments = @listing.comments.build

        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
                name: @listing.title,
                description: @listing.description,
                # you need to fix this -> (@listing.floating_point_price * 100).to_i ??
                amount: @listing.price.to_i * 100,
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                    listing_id: @listing.id
                }
            },
            success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
            cancel_url: "#{root_url}listings"
        )
    
        @session_id = session.id

    end
    
    def new
        @listing = Listing.new
    end

    def edit
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
  