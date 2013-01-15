class CreateDailyTasks < ActiveRecord::Migration
  def change
    create_table :daily_tasks do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.datetime :plan_start_timeline
      t.datetime :plan_finish_timeline
      t.integer :accomplishment
      t.integer :status
      t.string :url

      t.timestamps
    end
  end
end
