class CreateStudylogs < ActiveRecord::Migration
  def change
    create_table :studylogs do |t|
      t.integer :nueron_id
      t.integer :user_id
      t.integer :view_count
      t.integer :number_of_quiz
      t.integer :correct_answers

      t.timestamps null: false
    end

    add_index :studylogs, [:nueron_id, :user_id], unique: true
  end
end
