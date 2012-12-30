require 'spec_helper'

describe "google_analytics/index" do
  before(:each) do
    assign(:google_analytics, [
      stub_model(GoogleAnalytic,
        :unique_visitor => 1,
        :visit_product => 1,
        :product_page => 1,
        :average_page => 1,
        :conversion1 => "Conversion1",
        :stay_time => "Stay Time",
        :bounce_rate => "Bounce Rate",
        :click => 1,
        :conversion2 => "Conversion2",
        :sat => 1,
        :gre => 1,
        :toefl => 1,
        :ielts => 1,
        :liuxue => 1,
        :page_view => 1
      ),
      stub_model(GoogleAnalytic,
        :unique_visitor => 1,
        :visit_product => 1,
        :product_page => 1,
        :average_page => 1,
        :conversion1 => "Conversion1",
        :stay_time => "Stay Time",
        :bounce_rate => "Bounce Rate",
        :click => 1,
        :conversion2 => "Conversion2",
        :sat => 1,
        :gre => 1,
        :toefl => 1,
        :ielts => 1,
        :liuxue => 1,
        :page_view => 1
      )
    ])
  end

  it "renders a list of google_analytics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Conversion1".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Stay Time".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bounce Rate".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Conversion2".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
