class PaymentsController < ApplicationController
    #Devise authentication does not allow the webhook to work correctly, authentication skipped for webhook method.
    skip_before_action :authenticate_user!, only: [:webhook]
    skip_before_action :verify_authenticity_token, only: [:webhook]
    
    
    def success        
       
    end

    def webhook
#Webhook to return from stripe payment and update the specific listing in the Listing table to reflect available => false and the the buyer id.
        payment_id= params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        listing_id = payment.metadata.listing_id
        user_id = payment.metadata.user_id
    
        

        p "listing id " + listing_id
        p "user id " + user_id
    

        Listing.find(listing_id).update(buyer_id: user_id)
        Listing.find(listing_id).update(available: false)

        head :ok
    end

        private
    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end

end
