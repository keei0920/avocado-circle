class CreateAvocados < ActiveRecord::Migration[7.0]
  def change
    create_table :avocados do |t|
      t.string        :name,       default: "アボカド", null: false
      t.date          :birth_day
      t.date          :watering  
      t.date          :transplant
      t.date          :fertilizer  
      t.references    :user,      foreign_key: true
      t.timestamps
    end
  end
  
end
