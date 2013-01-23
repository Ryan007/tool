class Permission < ActiveRecord::Base
  # attr_accessible :action, :desc, :name, :subject_class, :subject_id
  has_and_belongs_to_many :roles, :join_table => 'roles_permissions'
end
