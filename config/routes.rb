# encoding: utf-8
Tools::Application.routes.draw do
  

  # 论坛模块
  namespace :bbs do
    root :to => "base#index"
    # bbs首页
    get "admin/index"
    # bbs显示管理员信息
    get "admin/admin"
    # 论坛核心用户
    get 'admin/core_customer'
  end

  # 流量模块
  namespace :traffic do
    get "main/index"
    # 引荐流量
    get 'main/referral_traffic'
    # 自然访问流量
    get 'main/organic_traffic'
    # 自然访问流量
    get 'main/paid_traffic'

    # campaign 视图
    get 'main/campaign_view'
    # 搜索
    get 'main/search'

    # 流量相关的数据
    resources :clicks do
      get 'add_campaign', :on => :collection
      post 'save_campaign', :on => :collection

      get 'add_position', :on => :collection
      post 'save_position', :on => :collection

      get 'add_campaign', :on => :collection
      post 'save_campaign', :on => :collection

      get 'add_page', :on => :collection
      post 'save_page', :on => :collection

      get 'add_category', :on => :collection
      post 'save_category', :on => :collection

      get 'add_up_category', :on => :collection
      post 'save_up_category', :on => :collection


      get 'sum_campaign', :on => :collection
      get 'sum_position', :on => :collection
      get 'sum_page', :on => :collection
      get 'sum_category', :on => :collection
      get 'sum_child_category', :on => :collection
      get 'search_result', :on => :collection

      # get 'index_campaign', :on => :collection
    end

    # 统计谷歌广告
    resources :google_analytics do
      get 'show_traffic', :on => :collection
      get 'user_index', :on => :collection
    end

  end

  # 编辑模块
  namespace :editor do
    get 'main/index'
    # 显示详细内容
    get 'main/detail'

    # 关联广告页面
    resources :web_pages do
      get 'all', :on => :collection
      get 'detail', :on => :collection
    end
    # 关联类类别
    resources :tag_categories  do
      get 'detail', :on => :collection
      get 'all', :on => :collection
    end

    # 关联位置
    resources :positions  do
      get 'all', :on => :collection
      get 'detail', :on => :collection
    end

    # 关联活动
    resources :campaigns do 
      get 'detail', :on => :collection
      get 'all', :on => :collection
    end
  end


  # 任务模块
  namespace :task do
    get 'main/index'
    get 'main/me'
    get 'main/all'
    resources :daily_tasks do
      collection do
        get 'get_stuff_task'
      end
    end
  end
  # resources :daily_tasks do 
  #   collection do
  #     get 'me'
  #     get 'get_stuff_task'
  #   end
  # end
 
  get "calendar/index"

  # get "daily/me"

  # get "bbs_admin/index"

  # get "bbs_admin/admin"



  # # 关联广告页面
  # resources :web_pages do
  #   get 'all', :on => :collection
  #   get 'detail', :on => :collection
  # end
  # # 关联类类别
  # resources :tag_categories  do
  #   get 'detail', :on => :collection
  #   get 'all', :on => :collection
  # end

  # # 关联位置
  # resources :positions  do
  #   get 'all', :on => :collection
  #   get 'detail', :on => :collection
  # end

  # # 关联活动
  # resources :campaigns do 
  #   get 'detail', :on => :collection
  #   get 'all', :on => :collection
  # end

  # 用户系统devise 重写了注册组件
  devise_for :users, :controllers => {:registrations => "registrations"} 
   
  devise_scope :user do
    # 等待邮箱验证
    match "awaiting_confirmation", :to => "registrations#awaiting_confirmation", :via => [:get], :as => "awaiting_confirmation"
    # 微博用户授权以后如果没有注册就会来这个地址注册
    # match "users/weibo_sign_up", :to => "registrations#weibo_new", :via => [:get], :as => "new_weibo_user_registration"       
  end

  get "home/index"
  get "home/introduction"
  # 发送邮件到指定email里面
  # post "home/send_mail"
  # 发送核心会员方法
  # post "home/send_bbs_core_mail"


  # # 流量相关的数据
  # resources :clicks do
  #   get 'add_campaign', :on => :collection
  #   post 'save_campaign', :on => :collection

  #   get 'add_position', :on => :collection
  #   post 'save_position', :on => :collection

  #   get 'add_campaign', :on => :collection
  #   post 'save_campaign', :on => :collection

  #   get 'add_page', :on => :collection
  #   post 'save_page', :on => :collection

  #   get 'add_category', :on => :collection
  #   post 'save_category', :on => :collection

  #   get 'add_up_category', :on => :collection
  #   post 'save_up_category', :on => :collection


  #   get 'sum_campaign', :on => :collection
  #   get 'sum_position', :on => :collection
  #   get 'sum_page', :on => :collection
  #   get 'sum_category', :on => :collection
  #   get 'sum_child_category', :on => :collection
  #   get 'search_result', :on => :collection

  #   # # 论坛核心用户
  #   # get 'bbs_core_customer', :on => :collection

  #   # 引荐流量
  #   get 'referral_traffic', :on => :collection
  #   # 自然访问流量
  #   get 'organic_traffic', :on => :collection

  #   # 自然访问流量
  #   get 'paid_traffic', :on => :collection

  #   get 'index_campaign', :on => :collection
  # end

  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
