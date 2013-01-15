Given /^I have the list of clicks dated (.+) and clicks are (.+)$/ do |record_date, clicks|
	clicks.split(', ').each do |c|
		Click.create!(:record_date => record_date, :clicks => c)
	end
end

Given /^I have no clicks$/ do
  	Click.delete_all
end

Then /^I should have ([0-9]+) clicks?$/ do |count|
 	Click.count.should == count.to_i
end

Given /^I have one click and ID is 1$/ do
  	Click.create(:id => 1, :tagname => 'No.1', :clicks => "1000000")
end