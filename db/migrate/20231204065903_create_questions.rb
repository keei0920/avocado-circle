class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string        :title,   null: false
      t.text          :text,    null: false 
      t.references    :user,    foreign_key: true
      t.timestamps
    end
  end
end
