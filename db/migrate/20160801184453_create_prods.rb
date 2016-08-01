class CreateProds < ActiveRecord::Migration
  def change
    create_table :prods do |t|

      t.timestamps null: false
    end
  end
end
