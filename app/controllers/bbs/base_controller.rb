# encoding: utf-8
class Bbs::BaseController < ApplicationController
	before_filter :authenticate_user!
end