class AddOtherToGoogleAnalytic < ActiveRecord::Migration
  def change
    add_column :google_analytics, :other, :integer
  end
end
