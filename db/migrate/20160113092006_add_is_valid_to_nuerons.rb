class AddIsValidToNuerons < ActiveRecord::Migration
  def change
    add_column :nuerons, :is_valid, :boolean, default: true
  end
end
