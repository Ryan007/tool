namespace :bbs do
  desc "send bbs core customers to zhangning by email"
  task :core => :environment do
    SendBbs.core_customer_mailer("zhanghuaxun@xiaoma.com").deliver
    #SendBbs.core_customer_mailer("zhangning@xiaoma.com").deliver
  end
end