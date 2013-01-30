# encoding: utf-8
namespace :tools do
  desc "init permission for cancan"
  task :init => :environment do
    setup_actions_controllers
  end

  def setup_actions_controllers
    #  超级管理员
    write_permission("all", "manage", "Everything", "All operations", true)
    # 管理用户
    write_permission("User", "manage", "User admin", "All operations")
    write_permission("User", "read", "User read", "view User")
    write_permission("User", "update", "User update", "update User")
    write_permission("User", "delete", "User delete", "delete User")
    write_permission("User", "create", "User create", "create User")
    write_permission("User", "roles", "read User roles", "read roles")
    write_permission("User", "assign_roles", "update roles", "update User roles")
    # 管理角色
    write_permission("Role", "manage", "Role admin", "All operations")
    write_permission("Role", "read", "Role read", "view role")
    write_permission("Role", "update", "Role update", "update role")
    write_permission("Role", "delete", "Role delete", "delete role")
    write_permission("Role", "create", "Role create", "create role")
    write_permission("Role", "permissions", "read role permission", "read permission")
    write_permission("Role", "assign_permissions", "update permission", "update role permissions")
    # 管理权限
    write_permission("Permission", "manage", "Permission admin", "All operations")
    write_permission("Permission", "read", "Permission read", "view Permission")
    write_permission("Permission", "update", "Permission update", "update Permission")
    write_permission("Permission", "delete", "Permission delete", "delete Permission")
    write_permission("Permission", "create", "Permission create", "create Permission")
    # 编辑权限
    # write_permission("Main", "read", "Main index", "谷歌数据和广告位管理")


    
  end


  def eval_cancan_action(action)
    case action.to_s
    when "index", "show", "search"
      cancan_action = "read"
      action_desc = I18n.t :read
    when "create", "new"
      cancan_action = "create"
      action_desc = I18n.t :create
    when "edit", "update"
      cancan_action = "update"
      action_desc = I18n.t :edit
    when "delete", "destroy"
      cancan_action = "delete"
      action_desc = I18n.t :delete
    else
      cancan_action = action.to_s
      action_desc = "Other: " << cancan_action
    end
    return action_desc, cancan_action
  end

  def write_permission(class_name, cancan_action, name, description, force_id_1 = false)
    permission  = Permission.find(:first, :conditions => ["subject_class = ? and action = ?", class_name, cancan_action]) 
    if not permission
      permission = Permission.new
      permission.id = 1 unless not force_id_1
      permission.subject_class =  class_name
      permission.action = cancan_action
      permission.name = name
      permission.desc = description
      permission.save
    else
      permission.name = name
      permission.desc = description
      permission.save
    end
  end
end

