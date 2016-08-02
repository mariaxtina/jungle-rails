class AddUsers < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
