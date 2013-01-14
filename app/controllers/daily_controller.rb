class DailyController < ApplicationController
	before_filter :authenticate_user!
	def index
	end

	def me
	end
end
