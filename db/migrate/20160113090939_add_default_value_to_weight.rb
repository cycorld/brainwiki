class AddDefaultValueToWeight < ActiveRecord::Migration
  def change
    change_column :synapses, :weight, :integer, default: 1
  end
end
