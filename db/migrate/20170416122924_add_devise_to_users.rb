class AddDeviseToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :encrypted_password, :text, null: false, default: ""
    add_index :users, :email, unique: true
  end
end
