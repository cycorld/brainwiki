class AddViewcountToNuerons < ActiveRecord::Migration
  def change
    add_column :nuerons, :viewcount, :integer, default: 0
  end
end
