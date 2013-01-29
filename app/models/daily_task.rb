class DailyTask < ActiveRecord::Base
	belongs_to :user
  	# attr_accessible :accomplishment, :content, :plan_finish_timeline, :plan_start_timeline, :title, :user_id
end
