class AddTokenToNueron < ActiveRecord::Migration
  def change
    add_column :nuerons, :token, :string, uniquess: true
  end
end
