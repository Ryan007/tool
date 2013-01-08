# encoding: utf-8  
# language: zh-CN

def create_visitor
  @visitor ||= { 
    :username => "ryan",
    :email => "zhanghuaxun@xiaoma.com",
    :password => "123123",
    :password_confirmation => "123123"}
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, email: @visitor[:email])
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Sign in"
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

# Given /^a user is logged_in$/ do
#   @user = FactoryGirl.create(:user)
#   @user.confirm!
#   visit new_user_session_path
#   fill_in '电子邮件', :with => @user.email
#   fill_in '输入密码', :with => @user.password
#   click_on '登陆'
# end

# Given /^a valid user$/ do
#     @user = User.create!({
        # :username => "ryan",
        # :email => "zhanghuaxun@xiaoma.com",
        # :password => "123123",
        # :password_confirmation => "123123"
#     })
# end

# Given /^a logged in user$/ do
#     Given "a valid user"
#     steps %Q{
#         When I go to homepage
#         When I follow "登录"
#         And I fill in "电子邮件" with "zhanghuaxun@xiaoma.com"
#         And I fill in "密码" with "123123"
#         And I press "登录"
#         Then I should see "您好,ryan"
#     }
#     # Given "a valid user"
#     # visit new_user_session_path
#     # Then I should see "登陆"
#     # fill_in "电子邮件", :with => "zhanghuaxun@xiaoma.com"
#     # fill_in "输入密码", :with => "123123"
#     # click_on "登陆"
# end

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