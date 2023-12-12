class SolutionToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :solution, :integer
  end
end
