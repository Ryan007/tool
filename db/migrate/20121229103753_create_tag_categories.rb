class CreateTagCategories < ActiveRecord::Migration
  def change
    create_table :tag_categories do |t|
      t.string :name
      t.text :description
      t.integer :uid

      t.timestamps
    end
  end
end
