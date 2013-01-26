class AddVisitsToGoogleAnalytic < ActiveRecord::Migration
  def change
    add_column :google_analytics, :visits, :integer
  end
end
