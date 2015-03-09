class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.integer :name
      t.decimal :credits, default: 100

      t.timestamps null: false
    end
  end
end
