class AddInitialNote < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string  :title
      t.text    :body
      t.integer :user_id
      t.integer :day_id

      t.timestamps
    end

    add_index :notes, :user_id
    add_index :notes, :day_id
  end
end
