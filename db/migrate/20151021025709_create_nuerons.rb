class CreateNuerons < ActiveRecord::Migration
  def change
    create_table :nuerons do |t|
      t.integer :user_id
      t.string :title
      t.string :vid
      t.text :note

      t.timestamps null: false
    end
    add_index :nuerons, :user_id
    add_index :nuerons, :title
  end
end
