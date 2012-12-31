# encoding: utf-8
Xmims::Application.routes.draw do
  

  # 统计谷歌广告
  resources :google_analytics do
    get 'show_traffic', :on => :collection
    get 'user_index', :on => :collection
  end

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
  post "home/send_mail"


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

    # 论坛核心用户
    get 'bbs_core_customer', :on => :collection
    # 引荐流量
    get 'referral_traffic', :on => :collection
    # 自然访问流量
    get 'organic_traffic', :on => :collection
    get 'index_campaign', :on => :collection
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
