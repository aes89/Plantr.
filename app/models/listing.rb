class Listing < ApplicationRecord
  
    belongs_to :seller, :class_name => 'User'
    has_one :buyer, :class_name => 'User'
    has_one_attached :picture
    has_many :comments, dependent: :destroy
    
    enum material: {unknown: 0, plastic: 1, cement: 2, teracotta: 3, ceramic: 4, metal: 5, wicker: 6, wire: 7}
    enum shape: {other: 0, round: 1, square: 2}
    enum drainage: {"Has Drainage": 0, "No Drainage": 2}
    enum saucer: {"Saucer Included": 0, "No Saucer Included": 1}

    validates :title, :description, :material, :height, :width, :shape, :drainage, :saucer, :price, presence: true
end
