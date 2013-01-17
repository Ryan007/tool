class CreatePaidTraffics < ActiveRecord::Migration
  def change
    create_table :paid_traffics do |t|
      t.date :current_date
      t.string :keyword
      t.integer :clicks
      t.integer :goal1
      t.integer :goal3
      t.string :conversion1_rate
      t.string :conversion3_rate

      # t.timestamps
    end
  end
end
