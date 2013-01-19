# encoding: utf-8
class Traffic::BaseController < ApplicationController
	before_filter :authenticate_user!
end