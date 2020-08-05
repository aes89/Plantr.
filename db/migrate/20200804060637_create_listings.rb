class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.float :height
      t.float :width
      t.integer :shape
      t.float :price
      t.integer :drainage
      t.integer :saucer
      t.integer :material
      t.string :colour

      t.timestamps
    end
  end
end
