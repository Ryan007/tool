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
end
