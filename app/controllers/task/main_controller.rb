# encoding: utf-8
class Task::MainController < Task::BaseController
	# before_filter :authorize_activity!

	def me
		@today0 = Time.now.midnight + 8.hours - 1.day
		@today = Time.now.midnight + 8.hours#(Time.now.beginning_of_day)
		@tomorrow = Time.now.midnight + 1.day + 8.hours #(Time.now.end_of_day)
		@tomorrow1 = Time.now.midnight + 2.day + 8.hours
		time_range = (Time.now.midnight - 1.day + 8.hours)..(Time.now.midnight+ 8.hours)
		

		@dailies = User.find(current_user.id).daily_tasks
		.where(
			"(plan_start_timeline >=? AND plan_start_timeline < ?) 
			OR 
			(plan_finish_timeline >=? AND plan_finish_timeline <?)
			OR 
			(plan_start_timeline <? AND plan_finish_timeline >=?)",
			@today, @tomorrow, @today, @tomorrow, @today, @tomorrow)

		@ye = User.find(current_user.id).daily_tasks
		.where(
			"(plan_start_timeline >=? AND plan_start_timeline < ?) 
			OR 
			(plan_finish_timeline >=? AND plan_finish_timeline <?)
			OR 
			(plan_start_timeline <? AND plan_finish_timeline >=?)",
			@today0, @today, @today0,@today, @today0, @today)

		@tom = User.find(current_user.id).daily_tasks
		.where(
			"(plan_start_timeline >=? AND plan_start_timeline < ?) 
			OR 
			(plan_finish_timeline >=? AND plan_finish_timeline <?)
			OR 
			(plan_start_timeline <? AND plan_finish_timeline >=?)",
			@tomorrow, @tomorrow1, @tomorrow, @tomorrow1, @tomorrow, @tomorrow1)

		#.where("(plan_finish_timeline >= #{time_from.to_date} and plan_start_timeline <= #{time_to.to_date}) OR (plan_finish_timeline <= #{time_to.to_date} and plan_start_timeline <= #{time_to.to_date})")
		# (plan_finish_timeline >= #{time_from.to_date} and plan_start_timeline <= #{time_to.to_date}) OR (plan_finish_timeline <= #{time_to.to_date} and plan_start_timeline <= #{time_to.to_date}) 
		# plan_start_timeline <= unix_timestamp(#{time_from.to_date})
	end

	def index

	end
end