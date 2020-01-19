class CreateProductImages < ActiveRecord::Migration[6.0]
  def change
    create_table :product_images do |t|
      t.string :image_url
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
