class Listing < ApplicationRecord
    belongs_to :user
    
    enum material: {unknown: 0, plastic: 1, cement: 2, teracotta: 3, ceramic: 4, metal: 5, wicker: 6, wire: 7}
    enum shape: {other: 0, round: 1, square: 2}
    enum drainage: {Drainage: 0, "No Drainage": 2}
    enum saucer: {"Saucer Included": 0, "No Saucer Included": 1}

    validates :title, :description, :material, :height, :width, :shape, :drainage, :saucer, :price, presence: true
end
