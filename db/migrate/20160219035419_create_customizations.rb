class CreateCustomizations < ActiveRecord::Migration
  def change
    create_table :customizations do |t|
      t.integer :item_id
      t.integer :modifier_id

      t.timestamps null: false
    end
  end
end
