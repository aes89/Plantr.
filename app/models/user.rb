class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :listings,  dependent: :destroy - from previous version, too add in future
  has_many :owned_listings, :class_name => 'Listing', :foreign_key => 'seller_id'
  has_many :bought_listings, :class_name => 'Listing', :foreign_key => 'buyer_id'
end
