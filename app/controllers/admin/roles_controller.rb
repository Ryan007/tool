# encoding: utf-8
class Admin::RolesController < Admin::BaseController
  # before_filter :authenticate_user!
  # 两种验证方式 前面会加载model 后面的不会加载model
  # load_and_authorize_resource
  #authorize_resource

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles }
    end
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to admin_role_path(@role), notice: 'Role was successfully created.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to admin_role_path(@role), notice: 'Role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to admin_roles_url , notice: 'Role was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  # 查找所有角色的权限
  def permissions
    @role = Role.find(params[:id])
    @permissions_all = Permission.all
    @permissions_role = @role.permissions
  end
  # 保存角色权限分配
  def assign_permissions
    if current_user.roles.include?(Role.find(1))
      @role = Role.find(params[:id])
      # 拿出此次得到权限数组
      permission_ids = params[:permission_ids]
      # 删除原来所有的关系
      @role.permissions.delete(@role.permissions)
      if not permission_ids.nil?
        permission_ids.each do |permission_id| 
          permission = Permission.find_by_id(permission_id)
          @role.permissions << permission
          # unless @user.roles.include? role
          #   @user.roles << role
          # end     
        end
      end
      redirect_to admin_role_path(@role)
    else
      flash[:notice] = "对不起，您没有权限修改！" 
      redirect_to admin_users_url
    end
  end
end
