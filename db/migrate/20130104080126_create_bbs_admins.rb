class CreateBbsAdmins < ActiveRecord::Migration
  def change
    create_table :bbs_admins do |t|
      t.integer :uid
      t.string :modaction
      t.date :dateline
      t.integer :count
      t.integer :posts

      # t.timestamps
    end
  end
end
