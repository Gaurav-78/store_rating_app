class CreateStores < ActiveRecord::Migration[7.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
