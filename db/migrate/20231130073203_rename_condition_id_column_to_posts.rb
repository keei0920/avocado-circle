class RenameConditionIdColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :condition_id, :condition
  end
end
