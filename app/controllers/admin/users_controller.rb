# encoding: utf-8
class Admin::UsersController < Admin::BaseController
  # before_filter :authenticate_user!
  # 两种验证方式 前面会加载model 后面的不会加载model
  # load_and_authorize_resource
  before_filter :find_user, :only => [:show, :edit, :update, :destroy, :activity]

  # GET /admin/users
  # GET /admin/users.json
  def index
    @users = User.order("created_at desc").paginate(:page => params[:page], :per_page => 20)
  end
  
  # 新建用户
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    # 手动验证 跳过验证,验证时间会被设定为当前创建的时间
    @user.skip_confirmation!
    if @user.save
      flash[:notice] = "用户创建成功."
      redirect_to admin_users_path
    else
      flash[:alert] = "用户创建失败."
      render :action => "new"
    end
  end
  
  # 显示用户
  def show
    
  end
  
  # 编辑用户
  def edit
    
  end
  
  # 完成编辑用户
  def update
    # 如果密码留空,就删除密码
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update_attributes(params[:user])
      flash[:notice] = "成功编辑用户."
      redirect_to admin_users_path
    else
      flash[:alert] = "编辑用户失败."
      render :action => "edit"
    end
  end
  
  # 删除用户操作
  def destroy
    if @user == current_user
      flash[:alert] = "你不能删除你自己!"
    else
      @user.destroy
      flash[:notice] = "用户已经成功删除."
    end
    redirect_to admin_users_path
  end

  # 锁定用户
  def lock
    if @user == current_user
      flash[:alert] = "你不能锁定你自己!"
    else
      @user.lock_access!
      flash[:notice] = "用户已经成功锁定."
    end    
    redirect_to :back
  end

  # 解锁用户
  def unlock  
    @user.unlock_access!
    flash[:notice] = "用户已经成功解锁." 
    redirect_to :back
  end


  # 查看所有角色
  def roles
    @user = User.find(params[:id])
    @roles_all = Role.all
    @roles = @user.roles
  end
  # 保存更新角色
  def assign_roles
    @user = User.find(params[:id])
    # 拿出此次得到角色数组
    role_ids = params[:role_ids]
    # 删除原来所有的关系
    @user.roles.delete(@user.roles)
    if not role_ids.nil?
      role_ids.each do |role_id| 
        role = Role.find_by_id(role_id)
        @user.roles << role
        # unless @user.roles.include? role
        #   @user.roles << role
        # end     
      end
    end
    redirect_to admin_user_path(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
