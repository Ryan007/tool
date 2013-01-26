class AddOrganicToGoogleAnalytic < ActiveRecord::Migration
  def change
    add_column :google_analytics, :organic, :integer
  end
end
