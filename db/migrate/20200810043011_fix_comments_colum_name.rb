class FixCommentsColumName < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :comment, :comment_body
  end
end
