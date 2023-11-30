class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.date       :date,             null: false
      t.integer    :condition_id,     null: false
      t.text       :text            
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end
