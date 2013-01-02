class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable, :confirmable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :last_sign_in_at
  # attr_accessible :title, :body

  if Rails.env.production?
    attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :confirmed_at, :last_sign_in_at
  else
    attr_accessible :username, :email, :password, :password_confirmation, :remember_me,  :confirmation_token,
      :admin, :sign_in_count, :password_salt, :confirmed_at, :confirmation_sent_at, :created_at, :updated_at,
      :encrypted_password, :last_sign_in_at
  end

  def self.test
    User.new(:email => "helloworld", :username => "zzzhhh")
    puts "helloworld-------------------#{Time.now}"
  end

  def self.send_bbs_core_mail(email1)
      # 验证email
    before_at = /([a-zA-Z0-9]+(_?[a-zA-Z0-9])+)/  
    after_at = /(\w)+((\.\w{2,3}){1,3})+/  
    email = /^(#{before_at}@#{after_at})$/ 
    # email1 = params[:email]
    # 校验email字段
    if email1
      if (email =~ email1).nil?
          flash[:notice] = '发送失败，您的email地址不合法!'
        else
          SendBbs.core_customer_mailer(email1).deliver
          flash[:notice] = '发送成功!'
      end
      redirect_to root_url
    end
  end


end
