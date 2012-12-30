# encoding: utf-8
class CommentMailer < ActionMailer::Base
  # default :from => "goodboyryan007@gmail.com"
  default :from => "noreply@xiaoma.com"


  def comment_notify_email(recipient, subject, message)
  		
	    @url  = "http://example.com/login"
	    attachments["rails.png"] = File.read("#{Rails.root}/app/assets/images/rails.png")
	    
	    @now = Time.now

	    @recipients = recipient
	    @from = 'noreply@xiaoma.com'
	    @subject = "流量数据统计表"
	    
	    attachments["引荐流量#{@now.strftime("%Y-%m-%d")}.xls"] = File.read("#{Rails.root}/download/triffs/#{@now.strftime('%Y-%m-%d')}-ReferralTraffic.xls")
	    # attachments["自然流量#{@now.strftime("%Y-%m-%d")}.xls"] = File.read("#{Rails.root}/download/triffs/#{@now.strftime('%Y-%m-%d')}-OrganicTraffic.xls")
	    # attachments["产品流量#{@now.strftime("%Y-%m-%d")}.xls"] = File.read("#{Rails.root}/download/triffs/#{@now.strftime('%Y-%m-%d')}-Campaign.xls")

	    mail(:to => "#{recipient}", :subject => @subject)
	    # mail(:to => recipient, :subject => "Welcome to My Awesome Site") do |format|
	    #    format.html
	    #   # format.html{render 'another_template'}
	    #   # format.text{render :text => 'Render text'}
	    # end
	    # puts "----#{recipient}----#{subject} ----#{message}"
	    # puts mail.class

	    
  		
		# @subject = subject  
		# @recipients = recipient
		# @from = 'noreply@xiaoma.com'  
		# @sent_on = Time.now
		# @body["title"] = 'This is title'  
		# @body["email"] = 'noreply@xiaoma.com'  
		# @body["message"] = message
		# attachments['filename.jpg'] = File.read("/pubulic/#{}.jpg")
		# @headers = {} 
    	# mail(:to => "#{recipient}", :subject => "#{message}")
    	# puts "----#{recipient}----#{subject} ----#{message}"
  end
end