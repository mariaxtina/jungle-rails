class DropTableProds < ActiveRecord::Migration
  def change
    drop_table :prods
  end
end
