class CreateQuizHistories < ActiveRecord::Migration
  def change
    create_table :quiz_histories do |t|
      t.integer :quiz_id
      t.integer :nueron_id
      t.integer :user_id
      t.boolean :correct
      t.string :question
      t.string :answer

      t.timestamps null: false
    end
  end
end
