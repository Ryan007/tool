# encoding: utf-8
class Task::BaseController < ApplicationController
	before_filter :authenticate_user!
end