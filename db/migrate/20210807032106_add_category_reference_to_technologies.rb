class AddCategoryReferenceToTechnologies < ActiveRecord::Migration[6.1]
  def change
    add_reference :technologies, :category, null: false, foreign_key: true
  end
end
