# encoding: utf-8
class Task::DailyTasksController < Task::BaseController

    # @dairy_plans = DairyPlan.where("student_id = ? and ( plantype is null or plantype = ? ) ", @student.id, 1  )
    # @json_array = []
    # @dairy_plans.each do |plan|
    # obj_hash = plan.attributes
    #   obj_hash[:title] = "上课 查看详细"
    #   obj_hash[:start] = plan.plan_date.strftime('%Y-%m-%d')
    #   obj_hash[:url] = student_dairy_plan_url(@student, plan)
    #   @json_array.push obj_hash
    # end
    #@hash_org = @dairy_plans.to_hash
    # render:json => @json_array

            # 'id' => 222,
            # 'title' => "Event2",
            # 'start' => "$year-$month-20",
            # 'end' => "$year-$month-22",
            # 'url' => "http://yahoo.com/"
    def get_stuff_task
        @tasks = User.find(current_user.id).daily_tasks
        @json_arr = []
        @tasks.each do |task|
            # puts "----#{task.attributes}"
            json_obj = {'id' => '','title' => "", 'start' => '', 'end' => '', 'url' => ''}
            json_obj[:title] = task.title
            json_obj[:id] = task.id
            json_obj[:start] = task.plan_start_timeline
            json_obj[:end] = task.plan_finish_timeline
            json_obj[:url] = daily_task_path(task)

            @json_arr.push json_obj
        end

        render :json => @json_arr.to_json
    end

    def index
        @daily_tasks = DailyTask.all

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @daily_tasks }
        end
    end


    def show
        @refer = request.referer
        @daily_task = DailyTask.find(params[:id])

        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @daily_task }
        end
    end

    # GET /daily_tasks/new
    # GET /daily_tasks/new.json
    def new
    @daily_task = DailyTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @daily_task }
    end
    end

    # GET /daily_tasks/1/edit
    def edit
    @daily_task = DailyTask.find(params[:id])
    end

    # POST /daily_tasks
    # POST /daily_tasks.json
    def create
        date1 = DateTime.strptime(params[:daily_task]['plan_start_timeline'] + " CCT", "%Y-%m-%d %H:%M %Z")
        date2 = DateTime.strptime(params[:daily_task]['plan_finish_timeline'] + " CCT", "%Y-%m-%d %H:%M %Z")
        params[:daily_task]['plan_start_timeline'] = date1

        @daily_task = DailyTask.new(params[:daily_task])

        respond_to do |format|
          if @daily_task.save
            format.html { redirect_to [:task, @daily_task], notice: 'Daily task was successfully created.' }
            format.json { render json: @daily_task, status: :created, location: @daily_task }
          else
            format.html { render action: "new" }
            format.json { render json: @daily_task.errors, status: :unprocessable_entity }
          end
        end
    end

    # PUT /daily_tasks/1
    # PUT /daily_tasks/1.json
    def update
    @daily_task = DailyTask.find(params[:id])

    respond_to do |format|
      if @daily_task.update_attributes(params[:daily_task])
        format.html { redirect_to @daily_task, notice: 'Daily task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @daily_task.errors, status: :unprocessable_entity }
      end
    end
    end

    # DELETE /daily_tasks/1
    # DELETE /daily_tasks/1.json
    def destroy
        @daily_task = DailyTask.find(params[:id])
        

        respond_to do |format|
            if current_user.id == @daily_task.user_id
                @daily_task.destroy
                format.html { redirect_to task_daily_tasks_url }
                format.json { head :no_content }
            else
                format.html { redirect_to task_daily_tasks_url, :notice => 'Sorry,你不能删除其他人的任务！' }
            end
        end
    end
end
