class BbsAdmin < ActiveRecord::Base
  attr_accessible :count, :dateline, :modaction, :posts, :uid
end
