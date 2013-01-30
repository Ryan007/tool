class CalendarController < ApplicationController
	before_filter :authenticate_user!
	before_filter :authorize_activity!
	def index
		 @tasks = User.find(current_user.id).daily_tasks
	end

	def me
	end
end
