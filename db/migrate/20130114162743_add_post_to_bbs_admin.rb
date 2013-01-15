class AddPostToBbsAdmin < ActiveRecord::Migration
  def change
    add_column :bbs_admins, :post, :integer
  end
end
