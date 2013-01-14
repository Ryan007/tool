class RemoveFriendFromBbsAdmin < ActiveRecord::Migration
  def up
    remove_column :bbs_admins, :friend
    remove_column :bbs_admins, :post
    remove_column :bbs_admins, :doing
    remove_column :bbs_admins, :blog
    remove_column :bbs_admins, :thread
    remove_column :bbs_admins, :share
    remove_column :bbs_admins, :online
    remove_column :bbs_admins, :post_back
    remove_column :bbs_admins, :yd_time

  end

  def down
    add_column :bbs_admins, :friend, :integer
    add_column :bbs_admins, :post, :integer
    add_column :bbs_admins, :doing, :integer
    add_column :bbs_admins, :blog, :integer
    add_column :bbs_admins, :thread, :integer
    add_column :bbs_admins, :share, :integer
    add_column :bbs_admins, :online, :integer
    add_column :bbs_admins, :post_back, :integer
    add_column :bbs_admins, :yd_time, :integer
  end
end
