class CreateModifiers < ActiveRecord::Migration
  def change
    create_table :modifiers do |t|
      t.string :name
      t.decimal :deltaPrice, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
