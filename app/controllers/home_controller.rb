class HomeController < ApplicationController
  def index
  	CommentMailer.comment_notify_email("goodboyryan@126.com", "helloworld", 'helllloooooo').deliver
  end
end
