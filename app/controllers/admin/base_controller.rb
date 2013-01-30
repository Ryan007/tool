# encoding: utf-8
class Admin::BaseController < ApplicationController
	before_filter :authenticate_user!
	before_filter :authorize_activity!
	before_filter :authorize_super_admin!
end