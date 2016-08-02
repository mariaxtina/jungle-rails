class AddProductId < ActiveRecord::Migration
  def change
     # add_reference :reviews, :product, foreign_key: true
     # add_reference :reviews, :user, foreign_key: true

     add_column :reviews, :product_id, :integer
     add_column :reviews, :user_id, :integer
  end
end
