class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :zip
      t.string :address1
      t.string :address2
      t.string :tel
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
