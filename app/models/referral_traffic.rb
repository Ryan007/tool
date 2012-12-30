class ReferralTraffic < ActiveRecord::Base
  attr_accessible :clicks, :conversion1_rate, :conversion3_rate, :current_date, :goal1, :goal3, :source_name
end
