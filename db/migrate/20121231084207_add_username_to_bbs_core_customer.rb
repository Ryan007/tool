class AddUsernameToBbsCoreCustomer < ActiveRecord::Migration
  def change
    add_column :bbs_core_customers, :username, :string
  end
end
