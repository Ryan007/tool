class AddReferralToGoogleAnalytic < ActiveRecord::Migration
  def change
    add_column :google_analytics, :referral, :integer
  end
end
