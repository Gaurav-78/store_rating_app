class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, limit: 60, null: false
      t.string :email
      t.string :address, limit: 400
      t.string :password_digest, null: false
      t.integer :role, null: false, default: 0  # 0: Normal, 1: Store Owner, 2: Admin

      t.timestamps
    end

    # Add unique index AFTER the table creation
    add_index :users, :email, unique: true
  end
end
