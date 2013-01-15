# encoding: utf-8

Feature: Sign up
    In order to get access to protected sections of the site
    As a user
    I want to be able to sign up
  
    Scenario:sign up
        When I go to homepage
        Then I should see "注册"
        When I follow "注册"
        Then I should see "用户名"
        Then I should see "电子邮件"
        Then I should see "密码"
        Then I should see "重输入"
        When I fill in "用户名" with "zhanghuaxun"
        When I fill in "电子邮件" with "zhanghuaxun@xiaoma.com"
        When I fill in "密码" with "1q2w3e4r"
        When I fill in "重输入" with "1q2w3e4r"
        When I press "完成"
        Then I should see "去验证您的邮箱"