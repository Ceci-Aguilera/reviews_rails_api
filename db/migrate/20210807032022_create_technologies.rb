class CreateTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :technologies do |t|
      t.string :title
      t.float :score
      t.string :image_url
      t.string :slug
      t.integer :amount

      t.timestamps
    end
  end
end
