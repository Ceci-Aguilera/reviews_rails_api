class RemoveColumnTechnologiesCategory < ActiveRecord::Migration[6.1]
  def change
    remove_reference :technologies, :category, index: true, foreign_key: true
  end
end
