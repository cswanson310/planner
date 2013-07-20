class AddInitialDay < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :user_id, null: false
      t.date    :date,    null: false

      t.timestamps
    end

    add_index :days, :user_id
    add_index :days, :date
  end
end
