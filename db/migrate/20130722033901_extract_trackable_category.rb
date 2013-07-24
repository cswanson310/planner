class ExtractTrackableCategory < ActiveRecord::Migration
  def change
    remove_column :trackables, :category, :string
    add_column :trackables, :track_category_id, :integer

    create_table :track_categories do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :track_categories, :name
  end
end
