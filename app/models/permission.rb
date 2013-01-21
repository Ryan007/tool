class Permission < ActiveRecord::Base
  attr_accessible :action, :desc, :name, :subject_class, :subject_id
end
