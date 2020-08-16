class ListingsController < ApplicationController
before_action :authenticate_user!, except: [:home]
before_action :set_listing, only: [:show, :edit, :update, :destroy]
before_action :set_drainage, :set_material, :set_saucer, :set_shape, only: [:new, :edit, :update, :home]

#show newest listing on home page, displays listing last added to Listing table.
    def home
        @listing = Listing.last 
    end 

    #"Browse" page displays all listings from Listings table, but filters for "available => true" (can be purchased) listings 
    def index
        @listing = Listing.all
    end

    #to add new listings to Listings table.
    def new
        @listing = Listing.new
    end

    #to display listings a user has been associated with as a buyer or a seller (values in the table, buyer id updated by webhook)
    def transactions
        @user_bought = Listing.where(:buyer_id => current_user.id)
        #only unavalable listings have been sold, not all of user's current listings
        @user_sold = Listing.where(:seller_id => current_user.id, :available => false)
    end

    def user_listings
        @user_listing = Listing.where(:seller_id => current_user.id)
    end

    def show
#comments are associated with a specific listing
        @comments = @listing.comments.all

        #to manage payments, using Stripe
        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{
                name: @listing.title,
                description: @listing.description,
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

    def create
        @listing = current_user.owned_listings.create(listing_params)
        @listing.seller_id = current_user.id
        #set "buyer" value as a temporary value, to be replaced with the user ID of a buyer with webhook after Stripe
        @listing.buyer_id = "temp"

        #fields that must be filled, make DRY in future
            if @listing.errors.any?
                set_material
                set_shape
                set_drainage
                set_saucer
                render "new"
            else 
                @listing.save
                redirect_to listings_path
            end 
    end

    def edit
       
    end
      
    def update
        @listing.seller_id = current_user.id
        @listing.save

              #fields that must be filled, make DRY in future
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
        params.require(:listing).permit(:title, :description, :material, :colour, :height, :width, :shape, :drainage, :saucer, :price, :picture, :seller_id, :available, :buyer_id)
    end

    def set_listing
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
  