class CreateStudylogs < ActiveRecord::Migration
  def change
    create_table :studylogs do |t|
      t.integer :nueron_id
      t.integer :user_id
      t.integer :view_count, default:0
      t.integer :number_of_quiz, default:0
      t.integer :correct_answers, default:0

      t.timestamps null: false
    end

    add_index :studylogs, [:nueron_id, :user_id], unique: true
  end
end
