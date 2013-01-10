#encoding: utf-8

Feature: Sign in
    In order to get access to protected sections of the site
    A user
    Should be able to sign in
  
    Scenario:Confirmed by email
        Given one valid user:
         | username        |  email                 |  password  | unconfirmed |
         | zhanghuaxun |  goodboyryan@126.com  |  password  | true               |

        When "goodboyryan@126.com" opens the email with subject "请激活您的邮箱"
        When they should see the email delivered from "noreply@xiaoma.com"
        When they click the first link in the email
        Then I should see "退出"
        Then I should see "您好,zhanghuaxun"
        Then I should see "您好,zhanghuaxun"

    Scenario:Login from the Form
        Given one valid user:
         | username        |  email                 |  password  | unconfirmed |
         | zhanghuaxun |  goodboyryan@126.com  |  password  | false               |

        When I am on the homepage
        When I follow "登录"
        Then I should see "电子邮件"
        Then I should see "密码"
        When I fill in "电子邮件" with "goodboyryan@126.com"
        When I fill in "密码" with "password"
        When I press "Login"
        Then I should see "您好,zhanghuaxun"
