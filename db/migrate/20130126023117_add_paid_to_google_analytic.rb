class AddPaidToGoogleAnalytic < ActiveRecord::Migration
  def change
    add_column :google_analytics, :paid, :integer
  end
end
