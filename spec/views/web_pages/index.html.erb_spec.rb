require 'spec_helper'

describe "web_pages/index" do
  before(:each) do
    assign(:web_pages, [
      stub_model(WebPage,
        :domain => "Domain",
        :categroy => 1,
        :content => "Content"
      ),
      stub_model(WebPage,
        :domain => "Domain",
        :categroy => 1,
        :content => "Content"
      )
    ])
  end

  it "renders a list of web_pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Domain".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
