# encoding: utf-8




# every 1.minute do
# 	puts "helloworld-------------------#{Time.now}"
# end 


# every 1.day, :at =&gt; '6:43 pm' 
#  do
#  	puts "helloworld-------------------#{Time.now}"
#   # runner "MyModel.task_to_run_at_four_thirty_in_the_morning"
# end
 
# every 1.day, :at =&gt; '19:30' do
#  	runner "User.send_bbs_core_mail"
#   	# runner "test"
# end

# every 1.hours do
# 	runner "User.send_bbs_core_mail('zhanghuaxun@xiaoma.com')"
# end

every :day, :at => '8:12 am' do # Many shortcuts available: :hour, :day, :month, :year, :reboot
  # runner "SomeModel.ladeeda"
  rake "bbs:core"
  rake "bbs:admin"
  rake "google_analytic:daily"
  # runner "User.send_bbs_core_mail('zhanghuaxun@xiaoma.com')"
end

# def test
# 	puts "helloworld-----001--------------#{Time.now}"
# end



# every '0 0 27-31 * *' do

#   command "echo 'you can use raw cron sytax too'"

# end

# every :hour do

#  # Many shortcuts available: :hour, :day, :month, :year, :reboot

#  runner "SomeModel.ladeeda"

#  end


#  every :sunday, :at =&gt; '12pm' do 

#   # Use any day of the week or :weekend, :weekday
  

#    runner "Task.do_something_great"

#  end

# every '0 0 27-31 * *' do

#   command "echo 'you can use raw cron sytax too'"

# end