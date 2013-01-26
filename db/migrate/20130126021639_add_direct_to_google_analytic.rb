class AddDirectToGoogleAnalytic < ActiveRecord::Migration
  def change
    add_column :google_analytics, :direct, :integer
  end
end
