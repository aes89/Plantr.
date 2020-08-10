class AddCommentToListings < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :listing, foreign_key: true
  end
end
