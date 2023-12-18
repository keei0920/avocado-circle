class SolutionToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :solution, :integer, default: 0, null: false
  end
end
