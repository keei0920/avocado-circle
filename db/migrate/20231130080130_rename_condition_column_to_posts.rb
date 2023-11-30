class RenameConditionColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :condition, :condition_id
  end
end
