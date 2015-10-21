class CreateNuerons < ActiveRecord::Migration
  def change
    create_table :nuerons do |t|
      t.integer :user_id
      t.string :title
      t.string :vid
      t.text :note

      t.timestamps null: false
    end
  end
end
