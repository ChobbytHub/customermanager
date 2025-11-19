class CreateLoginUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :login_users do |t|
      t.string :login
      t.integer :lvl
      t.string :name
      t.string :password_digest

      t.timestamps
    end
    add_index :login_users, :login, unique: true
  end
end
