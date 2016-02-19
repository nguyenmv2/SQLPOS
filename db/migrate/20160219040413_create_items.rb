class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.integer :menu_item_id

      t.timestamps null: false
    end
  end
end
