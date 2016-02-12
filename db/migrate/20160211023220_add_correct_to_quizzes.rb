class AddCorrectToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :correct, :string
  end
end
