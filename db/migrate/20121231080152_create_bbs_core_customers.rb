class CreateBbsCoreCustomers < ActiveRecord::Migration
  def change
    create_table :bbs_core_customers do |t|
      t.integer :uid
      t.integer :friend
      t.integer :doing
      t.integer :blog
      t.integer :post
      t.integer :thread
      t.integer :share
      t.integer :online
      t.integer :post_back
      t.integer :yd_time
      t.date :current_date

      # t.timestamps
    end
  end
end
