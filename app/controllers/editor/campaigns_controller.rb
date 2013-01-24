# encoding: utf-8
class Editor::CampaignsController < Editor::BaseController
  
  
  def index
    @name = params[:name]
    if !@name.nil?
      if !@name.empty?
        @campaigns = Campaign.where("name  LIKE ?", "%#{@name}%").order("created_at desc").paginate(:page => params[:page], :per_page => 20)
      else
        @campaigns = Campaign.order("created_at desc").paginate(:page => params[:page], :per_page => 20)
      end
    else
      @campaigns = Campaign.order("created_at desc").paginate(:page => params[:page], :per_page => 20)
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  # 显示出默认的
  def detail
    @campaign = Campaign.find(params[:id])
    if params[:start_date].nil?
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    else
      @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
      time_range = (@t.midnight - 1.day + 1.second)..@t.midnight
    end
    @clicks = Click.where('record_date' => time_range).where("campaign = #{params[:id]}").paginate(:page => params[:page], :per_page => 10)
    @total = Click.where('record_date' => time_range).where("campaign = #{params[:id]}").sum("clicks")
  end

  def new
    @campaign = Campaign.new
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def create
    @campaign = Campaign.new(params[:campaign])

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to editor_campaigns_url, notice: '活动创建成功！' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @campaign = Campaign.find(params[:id])

    respond_to do |format|
      if @campaign.update_attributes(params[:campaign])
        format.html { redirect_to editor_campaigns_url, notice: '活动更新成功.' }
      end
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    respond_to do |format|
      format.html { redirect_to campaigns_url }
      format.json { head :no_content }
    end
  end
end
