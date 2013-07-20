class AddInitialTrackable < ActiveRecord::Migration
  def change
    create_table :trackables do |t|
      t.string  :category, null: false
      t.integer :user_id
      t.integer :day_id
      t.text    :name
      t.float   :trackable_qty
      t.string  :units
      t.integer :trackable_tag_id

      t.timestamps
    end

    add_index :trackables, :category
    add_index :trackables, :user_id
    add_index :trackables, :day_id
    add_index :trackables, :trackable_tag_id
    add_index :trackables, :name
  end
end
