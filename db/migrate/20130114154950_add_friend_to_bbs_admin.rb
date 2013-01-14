class AddFriendToBbsAdmin < ActiveRecord::Migration
  def change
    add_column :bbs_admins, :friend, :integer
    add_column :bbs_admins, :doing, :integer
    add_column :bbs_admins, :blog, :integer
    add_column :bbs_admins, :thread, :integer
    add_column :bbs_admins, :share, :integer

    add_column :bbs_admins, :online, :integer
    add_column :bbs_admins, :post_back, :integer
    add_column :bbs_admins, :yd_time, :integer
  end
end
