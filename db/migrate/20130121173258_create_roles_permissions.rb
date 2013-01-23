class CreateRolesPermissions < ActiveRecord::Migration
  def up
  	create_table :roles_permissions do |t|
  		t.references :role
  		t.references :permission
    end
  end

  def down
  	drop_table :roles_permissions
  end
end