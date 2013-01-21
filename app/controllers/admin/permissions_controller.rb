# encoding: utf-8
class Admin::PermissionsController < Admin::BaseController
  # before_filter :authenticate_user!
  # 两种验证方式 前面会加载model 后面的不会加载model
  # load_and_authorize_resource
  # GET /admin/permissions
  # GET /admin/permissions.json
  def index
    @admin_permissions = Permission.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_permissions }
    end
  end

  # GET /admin/permissions/1
  # GET /admin/permissions/1.json
  def show
    @admin_permission = Permission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_permission }
    end
  end

  # GET /admin/permissions/new
  # GET /admin/permissions/new.json
  def new
    @admin_permission = Permission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_permission }
    end
  end

  # GET /admin/permissions/1/edit
  def edit
    @admin_permission = Permission.find(params[:id])
  end

  # POST /admin/permissions
  # POST /admin/permissions.json
  def create
    @admin_permission = Permission.new(params[:permission])

    respond_to do |format|
      if @admin_permission.save
        format.html { redirect_to admin_permission_path(@admin_permission), notice: 'Permission was successfully created.' }
        format.json { render json: @admin_permission, status: :created, location: @admin_permission }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/permissions/1
  # PUT /admin/permissions/1.json
  def update
    @admin_permission = Permission.find(params[:id])

    respond_to do |format|
      if @admin_permission.update_attributes(params[:permission])
        format.html { redirect_to admin_permission_path(@admin_permission), notice: 'Permission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/permissions/1
  # DELETE /admin/permissions/1.json
  def destroy
    @admin_permission = Permission.find(params[:id])
    @admin_permission.destroy

    respond_to do |format|
      format.html { redirect_to admin_permissions_url, notice: 'Permission was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
