class CreateLoginUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :login_users do |t|
      t.string :login, null: false
      t.integer :lvl
      t.string :name, null: false
      t.string :password_digest, null: false
      t.datetime :deleted_at # 論理削除用

      t.timestamps
    end
    add_index :login_users, :login, unique: true
  end
end
