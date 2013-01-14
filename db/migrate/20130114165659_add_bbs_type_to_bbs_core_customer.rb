class AddBbsTypeToBbsCoreCustomer < ActiveRecord::Migration
  def change
    add_column :bbs_core_customers, :bbs_type, :integer
  end
end
