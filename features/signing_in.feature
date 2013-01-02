# language: zh-CN
功能: 用户登录
  为了在网站上可以进行一些操作
	作为一个用户
	我要能够登录网站
	
    场景: 通过邮件确认
      假如 有如下用户:
         | username        |  email                 |  password  | unconfirmed |
         | zhanghuaxun |  zhanghuaxun@xiaoma.com  |  password  | true               |
      而且 "zhanghuaxun@xiaoma.com" opens the email with subject "请激活您的邮箱"
      而且 they click the first link in the email
      #而且 我应该看见"Your account was successfully confirmed"
      #而且 show me the page
      而且 我应该看见"您好,zhanghuaxun"
      
      
    场景: 从表单登录
      假如 有如下用户:
         | username  |        email             |  password  |
         | zhanghuaxun |  zhanghuaxun@xiaoma.com  |  password  |
      当 我来到主页
      当 我点击链接"登录"
  	  而且 我在输入框"电子邮件"填写"zhanghuaxun@xiaoma.com"
  	  而且 我在输入框"密码"填写"password"
      而且 我按下按钮"登录"
      而且 我应该看见"您好,zhanghuaxun"
      
    