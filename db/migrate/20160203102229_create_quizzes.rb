class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :user_id
      t.integer :nueron_id
      t.string :question
      t.string :answers
      t.integer :order

      t.timestamps null: false
    end
  end
end
