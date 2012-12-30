require 'spec_helper'

describe "google_analytics/show" do
  before(:each) do
    @google_analytic = assign(:google_analytic, stub_model(GoogleAnalytic,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Conversion1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Stay Time/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Bounce Rate/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Conversion2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
