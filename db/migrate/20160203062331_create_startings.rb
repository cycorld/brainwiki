class CreateStartings < ActiveRecord::Migration
  def change
    create_table :startings do |t|
      t.integer :nueron_id
      t.integer :user_id
      t.string :title
      t.string :subtitle
      t.text :description

      t.timestamps null: false
    end
  end
end
