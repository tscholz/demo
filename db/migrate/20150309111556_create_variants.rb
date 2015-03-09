class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.belongs_to :product
      t.boolean :is_active, default: true
      t.decimal :price, default: 0
      t.integer :quantity, default: 0

      t.timestamps null: false
    end
  end
end
