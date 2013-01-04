class AddUsernameToBbsAdmin < ActiveRecord::Migration
  def change
    add_column :bbs_admins, :username, :string
  end
end
