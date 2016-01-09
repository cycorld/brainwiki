class AddTokenToNueron < ActiveRecord::Migration
  def change
    add_column :nuerons, :token, :string, uniquess: true
    add_index :nuerons, :token
  end
end
