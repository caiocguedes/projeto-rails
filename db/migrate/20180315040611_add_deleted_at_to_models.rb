class AddDeletedAtToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :models, :deleted_at, :datetime
    add_index :models, :deleted_at
  end
end
