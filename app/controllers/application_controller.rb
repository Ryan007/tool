# encoding: utf-8
class ApplicationController < ActionController::Base
  
  
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
    # exception.action, exception.subject
  end
  
  private
    def authorize_users!
      authenticate_user!
      unless current_user.admin?
        flash[:alert] = "您的登录身份必须为管理员才能完成次操作"
        redirect_to root_path
      end
    end 

    def authorize_super_admin!
      authenticate_user!
      unless [3,1].include?(current_user.id)
        flash[:alert] = "您的登录身份必须为超级管理员才能完成次操作"
        redirect_to root_path
      end
    end

    def authorize_editor_admin! 
      authenticate_user!
    end
      
    def authorize_activity!
      authenticate_user!
      if current_user.roles.size == 0
        flash[:alert] = "您的账号可能没有激活,或已经失效,或没有权限访问,请联系管理员"
        redirect_to root_path
      end
    end
    
  
end
