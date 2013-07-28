class RemoveNullConstraintsOnIds < ActiveRecord::Migration
  def change
    # makes it a lot easier to test
    change_column :days, :user_id, :integer, null: true
    change_column :users, :last_name, :string, null: true
    change_column :users, :hashed_password, :string, null: true
  end
end
