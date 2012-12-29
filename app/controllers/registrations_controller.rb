# encoding: utf-8
class RegistrationsController < Devise::RegistrationsController
  # 微博注册界面
  # def weibo_new
  #     resource = build_resource({})
  #     if session[:weibo_name]
  #       resource.name = session[:weibo_name]
  #     end   
  #     respond_with resource
  #   end
   
  # 重写创建方法
  def create
    # 如果session里有 weibo_uid 且 Weibouser 没有此纪录 则创建一个Weibouser
    build_resource
    if resource.save
      # weibo用户 start 
      # if session[:weibo_uid]
      #         weibouser = Weibouser.find_by_wuid(session[:weibo_uid])
      #         if not weibouser
      #           weibouser = Weibouser.new
      #           weibouser.user = resource
      #           weibouser.wuid = session[:weibo_uid]
      #           weibouser.save
      #         end      
      #       end
      # weibo用户 end
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)          
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end
  # 提示去验证邮箱
  def awaiting_confirmation
    @email = params[:email]
    render :template => 'devise/registrations/awaiting_confirmation'
  end
   
  protected
  # 重写登录非法的返回
  def after_inactive_sign_up_path_for(resource)
    #respond_to?(:root_path) ? root_path : "/"
    "/awaiting_confirmation?email=#{resource.email}"  
  end
end
