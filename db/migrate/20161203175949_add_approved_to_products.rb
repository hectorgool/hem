class AddApprovedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :approved, :boolean, default: false
  end
end
