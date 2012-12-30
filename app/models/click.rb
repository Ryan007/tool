class Click < ActiveRecord::Base
  attr_accessible :campaign, :clicks, :page, :record_date, :tag_type, :tagname, :up_category
end
