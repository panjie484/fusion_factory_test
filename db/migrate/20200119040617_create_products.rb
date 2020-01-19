class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.string :type, null:false
      t.decimal :weight, null:false, precision: 12, scale: 2
      t.decimal :price, null:false, precision: 12, scale: 2
      t.string :image_url

      t.timestamps
    end
  end
end
