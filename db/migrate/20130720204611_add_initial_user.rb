class AddInitialUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name,      null: false
      t.string :last_name,       null: false
      t.string :email,           null: false
      t.string :hashed_password, null: false

      t.timestamps
    end

    add_index :users, :email
    add_index :users, :last_name
  end
end
