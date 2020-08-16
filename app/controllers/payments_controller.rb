class PaymentsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:webhook]
    skip_before_action :verify_authenticity_token, only: [:webhook]
    
    
    def success        
        # buyer_id = params[:buyer_id]
        # listing_id = params[:listing_id]

        # Listing.find(listing_id).update(buyer_id: buyer_id)
        # Listing.find(listing_id).update(available: false)
    end

    def webhook
        puts " I HAVE BEEN HIT  *******************"
        
        # pp params
        # payment_id= params[:data][:object][:payment_intent]
        # payment = Stripe::PaymentIntent.retrieve(payment_id)
        # listing_id = payment.metadata.listing_id
        # buyer_id = payment.metadata.buyer_id
        # # user_id = payment.metadata.user_id
        # Listing.find(listing_id).update(buyer_id: buyer_id)
        # p "listing id " + listing_id
        # p "buyer id " + buyer_id

        # p "user id " + user_id
   
        # status 200

        payment_id= params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        listing_id = payment.metadata.listing_id
        user_id = payment.metadata.user_id
    
        

        p "listing id " + listing_id
        p "user id " + user_id
    
        # redirect_to listings_path
        # status 200

        Listing.find(listing_id).update(buyer_id: user_id)
        Listing.find(listing_id).update(available: false)

        head :ok


        
    end

    def buy 
  
        @listing.buyer_id = current_user.id
        @listing.available = false
            respond_to do |format|
                if @listing.save
                    format.html { redirect_to @listing, notice: 'Congrats' }
                    # format.json { render :show, status: :created, location: @mushroom }
                else
                    format.html { render :new }
                    # format.json { render json: @mushroom.errors, status: :unprocessable_entity }
                end
            end
    end

        private
    def set_listing
        # @listing = Listing.find(params[:id])
        id = params[:id]
        @listing = Listing.find(id)
    end

end
