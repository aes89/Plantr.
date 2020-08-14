class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    
    def success

    end

    def webhook
        payment_id= params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        listing_id = payment.metadata.listing_id
        buyer_id = payment.metadata.buyer_id
        # user_id = payment.metadata.user_id
        Listing.find(listing_id).update(buyer_id: buyer_id)
        puts "++++++++++++++++++++PAYMENTS"
        p "listing id " + listing_id
        p "buyer id " + buyer_id
        # p "user id " + user_id
   
        pp params
        status 200
    end


end
