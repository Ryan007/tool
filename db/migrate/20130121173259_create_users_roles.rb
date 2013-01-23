class CreateUsersRoles < ActiveRecord::Migration
  def up
  	create_table :users_roles do |t|
  		t.references :user
  		t.references :role
    end
  end

  def down
  	drop_table :users_roles
  end
end
