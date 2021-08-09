class CreateTechnologyCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :technology_categories do |t|
      t.string :technology_category
      t.integer :technology_id
      t.integer :category_id

      t.timestamps
    end
    add_index :technology_categories, :technology_id
    add_index :technology_categories, :category_id
  end
end
