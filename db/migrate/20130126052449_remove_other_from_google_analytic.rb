class RemoveOtherFromGoogleAnalytic < ActiveRecord::Migration
  def up
    remove_column :google_analytics, :other
  end

  def down
    add_column :google_analytics, :other, :integer
  end
end
