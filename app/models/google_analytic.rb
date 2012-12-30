class GoogleAnalytic < ActiveRecord::Base
  attr_accessible :average_page, :bounce_rate, :click, :conversion1, :conversion2, :current_date, :gre, :ielts, :liuxue, :page_view, :product_page, :sat, :stay_time, :toefl, :unique_visitor, :visit_product
end
