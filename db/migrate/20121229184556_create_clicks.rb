class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.string :tagname
      t.integer :clicks
      t.date :record_date
      t.integer :campaign
      t.integer :page
      t.integer :up_category
      t.string :tag_type

      # t.timestamps
    end
  end
end
