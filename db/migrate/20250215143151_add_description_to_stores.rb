class AddDescriptionToStores < ActiveRecord::Migration[7.2]
  def change
    add_column :stores, :description, :text
  end
end
