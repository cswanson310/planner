class AddInitialTrackableTag < ActiveRecord::Migration
  def change
    create_table :trackable_tags do |t|
      t.integer :trackable_id, null: false
      t.integer :tag_category_id, null: false

      t.timestamps
    end

    add_index :trackable_tags, :trackable_id
    add_index :trackable_tags, :tag_category_id
  end
end
