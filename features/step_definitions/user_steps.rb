# encoding: utf-8  
# language: zh-CN

def create_visitor
    @visitor ||= { 
    :username => "zhanghuaxun",
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
    click_button "Login"
end

Given /^I am logged in$/ do
    create_user
    sign_in
end


Given /^有一管理员$/ do 
    FactoryGirl.create(:admin)
end

Given /^有一渠道管理员$/ do 
    FactoryGirl.create(:channel_admin)
end


Given /^one valid user:$/ do |table|
    table.hashes.each do |attributes|
        unconfirmed = attributes.delete("unconfirmed") == "true"
        @user = User.create!(attributes)
        #@user.update_attribute("admin", attributes["admin"] == "true")
        @user.confirm! unless unconfirmed
    end
end



