namespace :google_analytic do
  desc "send google_analytic to Raiytoo by email"
  task :daily => :environment do
    TrafficMailer.send_traffic("zhanghuaxun@xiaoma.com").deliver
    TrafficMailer.send_traffic("dongpei@xiaoma.com").deliver
    TrafficMailer.send_traffic("wangchao@xiaoma.com").deliver
  end

  task :clicks => :environment do
  	ClickMailer.send_traffic('zhanghuaxun@xiaoma.com').deliver
    ClickMailer.send_traffic('dongpei@xiaoma.com').deliver
    ClickMailer.send_traffic('wangchao@xiaoma.com').deliver
  end

end