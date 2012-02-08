class DeviseCreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :email
      t.string :encrypted_password
      t.timestamps
    end

    add_index :admins, :email, :unique => true
  end

end
