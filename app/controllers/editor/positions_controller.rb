class Editor::PositionsController < Editor::BaseController
  before_filter :authenticate_user!
  # GET /positions
  # GET /positions.json
  def index
    @name = params[:name]
    if !@name.nil?
      if !@name.empty?
        @positions = Position.where("name  LIKE ?", "%#{@name}%").order("created_at desc").paginate(:page => params[:page], :per_page => 20)
      else
        @positions = Position.order("created_at desc").paginate(:page => params[:page], :per_page => 20)
      end
    else
      @positions = Position.order("created_at desc").paginate(:page => params[:page], :per_page => 20)
    end
    
  end

  def all
    time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    @positions = Click.where('created_at' => time_range).order("created_at desc").paginate(:page => params[:page], :per_page => 20)
  end
  # GET /positions/1
  # GET /positions/1.json
  def show
    @position = Position.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @position }
    end
  end

  # 显示出默认的
  def detail
    @position = Position.find(params[:id])
    if params[:start_date].nil?
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    else
      @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
      time_range = (@t.midnight - 1.day + 1.second)..@t.midnight
    end
    @clicks = Click.where('record_date' => time_range).where("position = #{params[:id]}").paginate(:page => params[:page], :per_page => 100)
    @total = Click.where('record_date' => time_range).where("position = #{params[:id]}").sum("clicks")
  end

  # GET /positions/new
  # GET /positions/new.json
  def new
    @position = Position.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @position }
    end
  end

  # GET /positions/1/edit
  def edit
    @position = Position.find(params[:id])
  end

  # POST /positions
  # POST /positions.json
  def create
    @position = Position.new(params[:position])

    respond_to do |format|
      if @position.save
        format.html { redirect_to editor_positions_url, notice: 'Position was successfully created.' }
        format.json { render json: @position, status: :created, location: @position }
      else
        format.html { render action: "new" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /positions/1
  # PUT /positions/1.json
  def update
    @position = Position.find(params[:id])

    respond_to do |format|
      if @position.update_attributes(params[:position])
        format.html { redirect_to editor_positions_url, notice: 'Position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    respond_to do |format|
      format.html { redirect_to editor_positions_url }
      format.json { head :no_content }
    end
  end
end
