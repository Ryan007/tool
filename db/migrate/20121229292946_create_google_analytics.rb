class CreateGoogleAnalytics < ActiveRecord::Migration
  def change
    create_table :google_analytics do |t|
      t.date :current_date
      t.integer :unique_visitor
      t.integer :visit_product
      t.integer :product_page
      t.integer :average_page
      t.string :conversion1
      t.string :stay_time
      t.string :bounce_rate
      t.integer :click
      t.string :conversion2
      t.integer :sat
      t.integer :gre
      t.integer :toefl
      t.integer :ielts
      t.integer :liuxue
      t.integer :page_view

      # t.timestamps
    end
  end
end
