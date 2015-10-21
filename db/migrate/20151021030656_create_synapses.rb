class CreateSynapses < ActiveRecord::Migration
  def change
    create_table :synapses do |t|
      t.integer :user_id
      t.integer :origin_id
      t.integer :next_id
      t.integer :weight

      t.timestamps null: false
    end
    add_index :synapses, :user_id
    add_index :synapses, :origin_id
    add_index :synapses, :next_id
    add_index :synapses, [:origin_id, :next_id], unique: true
  end
end
