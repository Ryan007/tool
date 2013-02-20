# encoding: utf-8
class Task::MainController < Task::BaseController
	# before_filter :authorize_activity!

	def me
		@today = Time.now.midnight + 8.hours#(Time.now.beginning_of_day)
		@tomorrow = Time.now.midnight + 1.day + 8.hours #(Time.now.end_of_day)
		time_range = (Time.now.midnight - 1.day + 8.hours)..(Time.now.midnight+ 8.hours)
		@dailies = User.find(current_user.id).daily_tasks
		.where(
			"(plan_start_timeline >=? AND plan_start_timeline < ?) 
			OR 
			(plan_finish_timeline >=? AND plan_finish_timeline <?)
			OR 
			(plan_start_timeline <? AND plan_finish_timeline >=?)",
			@today, @tomorrow, @today, @tomorrow, @today, @tomorrow)


		# .where(
		# 	"(plan_start_timeline >=? AND plan_start_timeline < ?) 
		# 	OR 
		# 	(plan_finish_timeline >=? AND plan_finish_timeline <?)",
		# 	@today, @tomorrow, @today, @tomorrow)

		#.where("(plan_finish_timeline >= #{time_from.to_date} and plan_start_timeline <= #{time_to.to_date}) OR (plan_finish_timeline <= #{time_to.to_date} and plan_start_timeline <= #{time_to.to_date})")
		# (plan_finish_timeline >= #{time_from.to_date} and plan_start_timeline <= #{time_to.to_date}) OR (plan_finish_timeline <= #{time_to.to_date} and plan_start_timeline <= #{time_to.to_date}) 
		# plan_start_timeline <= unix_timestamp(#{time_from.to_date})
	end

	def index

	end
end