# encoding: utf-8
class ApplicationController < ActionController::Base
  
  
  protect_from_forgery

  # private
  #   def authorize_users!
  #     authenticate_user!
  #     unless current_user.admin?
  #       flash[:alert] = "您的登录身份必须为管理员才能完成次操作"
  #       redirect_to root_path
  #     end
  #   end 

  #   def authorize_super_admin!
  #     authenticate_user!
  #     unless current_user.admin? && [1,57, 330].include?(current_user.id)
  #       flash[:alert] = "您的登录身份必须为超级管理员才能完成次操作"
  #       redirect_to root_path
  #     end
  #   end 
    
    # def authorize_activity!
    #   authenticate_user!
    #   unless current_user.is_activity
    #     flash[:alert] = "您的账号没有激活,已经失效,请联系管理员"
    #     redirect_to root_path
    #   end
    # end
    
    # # 没有身份
    # def authorize_no_role!
    #   unless current_user.role != 0
    #     flash[:alert] = "您的登录身份太低,不能完成次操作"
    #     redirect_to root_path
    #   end
    # end
    # # 过滤 不能是学生
    # def authorize_not_student!
    #   authenticate_user!
    #   authorize_no_role!
    #   unless current_user.role != 1
    #     flash[:alert] = "您的登录身份必须为助理以上级别才能完成次操作"
    #     redirect_to root_path
    #   end
    # end 
  
end