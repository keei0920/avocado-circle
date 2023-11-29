class AddAvocadoIdToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :avocado, foreign_key: true
  end
end
