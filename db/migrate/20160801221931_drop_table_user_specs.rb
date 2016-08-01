class DropTableUserSpecs < ActiveRecord::Migration
  def change
    drop_table :user_specs
  end
end
