# encoding: utf-8  
# language: zh-CN


Given /^有一管理员$/ do 
  FactoryGirl.create(:admin)
end

Given /^有一渠道管理员$/ do 
  FactoryGirl.create(:channel_admin)
end



Given /^有如下用户:$/ do |table|
  table.hashes.each do |attributes|
    unconfirmed = attributes.delete("unconfirmed") == "true"
    @user = User.create!(attributes)
    #@user.update_attribute("admin", attributes["admin"] == "true")
    @user.confirm! unless unconfirmed
  end
end


Given /^我以他们的身份登录$/ do
  steps %Q{
    Given I am on the homepage
    When I follow "登录"
    And I fill in "电子邮件" with "#{@user.email}"
    And I fill in "密码" with "password"
    And I press "登录"
    Then I should see "您好,dev_test1"
  }
end


Given /^我以渠道管理员的身份登录$/ do
  steps %Q{
    Given I am on the homepage
    When I follow "登录"
    And I fill in "电子邮件" with "channel_admin_a@xiaoma.com"
    And I fill in "密码" with "1q2w3e4r"
    And I press "登录"
    Then I should see "您好,channelmanager"
  }
end