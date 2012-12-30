require 'spec_helper'

describe "google_analytics/new" do
  before(:each) do
    assign(:google_analytic, stub_model(GoogleAnalytic,
      :unique_visitor => 1,
      :visit_product => 1,
      :product_page => 1,
      :average_page => 1,
      :conversion1 => "MyString",
      :stay_time => "MyString",
      :bounce_rate => "MyString",
      :click => 1,
      :conversion2 => "MyString",
      :sat => 1,
      :gre => 1,
      :toefl => 1,
      :ielts => 1,
      :liuxue => 1,
      :page_view => 1
    ).as_new_record)
  end

  it "renders new google_analytic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => google_analytics_path, :method => "post" do
      assert_select "input#google_analytic_unique_visitor", :name => "google_analytic[unique_visitor]"
      assert_select "input#google_analytic_visit_product", :name => "google_analytic[visit_product]"
      assert_select "input#google_analytic_product_page", :name => "google_analytic[product_page]"
      assert_select "input#google_analytic_average_page", :name => "google_analytic[average_page]"
      assert_select "input#google_analytic_conversion1", :name => "google_analytic[conversion1]"
      assert_select "input#google_analytic_stay_time", :name => "google_analytic[stay_time]"
      assert_select "input#google_analytic_bounce_rate", :name => "google_analytic[bounce_rate]"
      assert_select "input#google_analytic_click", :name => "google_analytic[click]"
      assert_select "input#google_analytic_conversion2", :name => "google_analytic[conversion2]"
      assert_select "input#google_analytic_sat", :name => "google_analytic[sat]"
      assert_select "input#google_analytic_gre", :name => "google_analytic[gre]"
      assert_select "input#google_analytic_toefl", :name => "google_analytic[toefl]"
      assert_select "input#google_analytic_ielts", :name => "google_analytic[ielts]"
      assert_select "input#google_analytic_liuxue", :name => "google_analytic[liuxue]"
      assert_select "input#google_analytic_page_view", :name => "google_analytic[page_view]"
    end
  end
end
