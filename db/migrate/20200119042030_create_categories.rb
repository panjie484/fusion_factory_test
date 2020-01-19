class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :parent_id, null: false
      t.string :name, null: false
      t.string :image_url

      t.timestamps
    end
  end
end
