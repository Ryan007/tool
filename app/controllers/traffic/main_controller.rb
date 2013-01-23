# encoding: utf-8
class Traffic::MainController < Traffic::BaseController

	def index
	    time_range = (Time.now.midnight - 1.day)..Time.now.midnight
	    @clicks = Click.where('record_date' => time_range).paginate(:page => params[:page], :per_page => 20).group("page")
	    @click_count = Click.where('record_date' => time_range).sum(:clicks)
	    @pages = Click.where('record_date' => time_range)
	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @clicks }
	    end
	end

	# 以广告系列为中心
	def campaign_view
	    time_range = (Time.now.midnight - 1.day)..Time.now.midnight
	    @clicks = Click.where('record_date' => time_range).group("campaign")
	    @click_count = Click.where('record_date' => time_range).sum(:clicks)
	    @cams = Click.where('record_date' => time_range)
	    respond_to do |format|
	      format.html # index.html.erb
	    end
	end

  # 以广告系列为中心
  def search1
    if params[:start_date] && params[:end_date]
      if params[:start_date].strip.empty? && params[:end_date].strip.empty?
        @time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      else
        @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
        @t1 = DateTime.strptime(params[:end_date] + " CCT", "%Y-%m-%d")
        @time = @t.strftime("%Y-%m-%d")
        @time1 = @t1.strftime("%Y-%m-%d")
        @time_range = @time..@time1
      end
    else
      @time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    end

    # @clicks = Click.where('record_date' => time_range).select(" *, sum(clicks) as total_clicks").group('page').order("total_clicks DESC")
    # @click_count = Click.where('record_date' => time_range).sum('clicks')
    
    # SELECT `clicks`.page, SUM(`CLICKS`) AS total_clicks FROM `clicks` 
    # WHERE (`clicks`.`record_date` BETWEEN '2013-01-02 16:00:00' AND '2013-01-22 16:00:00') 
    # GROUP BY `POSITION` ORDER BY total_clicks DESC;
    # @clicks = Click.where('record_date' => time_range).group('position').select('*, sum(clicks) as total_clicks').order("total_clicks DESC")
    # @click_count = Click.where('record_date' => time_range).sum(:clicks)
    # @pages = Click.where('record_date' => time_range)
    # respond_to do |format|
    #     format.html # index.html.erb
    #     format.json { render json: @clicks }
    # end
    @clicks = Click.where('record_date' => @time_range).group("campaign").select("*, sum(clicks) as total_clicks").order("total_clicks DESC");
    @click_count = Click.where('record_date' => @time_range).sum(:clicks)
    @cams = Click.where('record_date' => @time_range)
    respond_to do |format|
      format.html # index.html.erb
    end

  end

    # 以广告系列为中心
  def search
    if params[:start_date] && params[:end_date]
      if params[:start_date].strip.empty? && params[:end_date].strip.empty?
        @time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      else
        @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
        @t1 = DateTime.strptime(params[:end_date] + " CCT", "%Y-%m-%d")
        @time = @t.strftime("%Y-%m-%d")
        @time1 = @t1.strftime("%Y-%m-%d")
        @time_range = @time..@time1
      end
    else
      @time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    end

    @clicks = Click.where('record_date' => @time_range).group("position").select("*, sum(clicks) as total_clicks").order("total_clicks DESC");
    @click_count = Click.where('record_date' => @time_range).sum(:clicks)
    @pos = Click.where('record_date' => @time_range)
    respond_to do |format|
      format.html # index.html.erb
    end

  end


	# refferal访问来源
  def referral_traffic

    if !params[:start_date].nil? 
      if !params[:start_date].empty?
        @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
        @time = @t.strftime("%Y-%m-%d")
        time_range = ((@t.midnight + 1.second) - 1.day)..@t.midnight
      else
        time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      end
    else
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    end

    @triffs = ReferralTraffic.where('current_date' => time_range).order("clicks DESC")
    @count_traffics = ReferralTraffic.where('current_date' => time_range)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # organic访问来源
  def organic_traffic
    if !params[:start_date].nil? 
      if !params[:start_date].empty?
        @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
        @time = @t.strftime("%Y-%m-%d")
        time_range = ((@t.midnight + 1.second) - 1.day)..@t.midnight
      else
        time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      end
    else
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    end

    @triffs = OrganicTraffic.where('current_date' => time_range).order("clicks DESC").paginate(:page => params[:page], :per_page => 50)
    @count_traffics = OrganicTraffic.where('current_date' => time_range)
    respond_to do |format|
      format.html # index.html.erb
    end

  end

  # paid访问来源
  def paid_traffic
    if !params[:start_date].nil? 
      if !params[:start_date].empty?
        @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
        @time = @t.strftime("%Y-%m-%d")
        time_range = ((@t.midnight + 1.second) - 1.day)..@t.midnight
      else
        time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      end
    else
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    end

    @paids = PaidTraffic.where('current_date' => time_range).order("clicks DESC").paginate(:page => params[:page], :per_page => 50)
    @count_traffics = PaidTraffic.where('current_date' => time_range)
    respond_to do |format|
      format.html # index.html.erb
    end

  end
end