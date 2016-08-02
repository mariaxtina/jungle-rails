class AddProductId < ActiveRecord::Migration
  def change
     add_column :reviews, :product_id, :integer
     add_column :reviews, :user_id, :integer
  end
end
