class AddClicksToOrganicTraffic < ActiveRecord::Migration
  def change
    add_column :organic_traffics, :clicks, :integer
  end
end
