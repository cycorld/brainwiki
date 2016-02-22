class CreateViewHistories < ActiveRecord::Migration
  def change
    create_table :view_histories do |t|
      t.integer :nueron_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
