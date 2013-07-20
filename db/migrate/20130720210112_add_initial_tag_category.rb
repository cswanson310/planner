class AddInitialTagCategory < ActiveRecord::Migration
  def change
    create_table :tag_categories do |t|
      t.string  :name, null: false
      t.integer :note_tag_id
      t.integer :trackable_tag_id

      t.timestamps
    end

    add_index :tag_categories, :name
    add_index :tag_categories, :note_tag_id
    add_index :tag_categories, :trackable_tag_id
  end
end
