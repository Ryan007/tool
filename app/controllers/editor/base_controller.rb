# encoding: utf-8
class Editor::BaseController < ApplicationController
	before_filter :authenticate_user!
	before_filter :authorize_activity!
end