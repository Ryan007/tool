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
	# refferal访问来源
  def referral_traffic
    # time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    # @triffs = ReferralTraffic.where('current_date' => time_range).order("clicks DESC")
    # @count_triffs = ReferralTraffic.where('current_date' => time_range).sum('clicks')
    # respond_to do |format|
    #   format.html
    #   format.json { @triffs }
    # end

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
    @count_triffs = ReferralTraffic.where('current_date' => time_range).sum('clicks')
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
    @count_triffs = OrganicTraffic.where('current_date' => time_range).sum("clicks")
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