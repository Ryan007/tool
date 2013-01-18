class Editor::MainController < Editor::BaseController

	def index
		@google_analytics = GoogleAnalytic.order("id desc").paginate(:page => params[:page], :per_page => 20)

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @google_analytics } 
	    end
	end

	def detail
		@traffic = GoogleTrafficRanking.where("`current_date`=? and channel_type=?",params[:dt],params[:t]).order("visits desc")

	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @traffic }
	    end
	end
end