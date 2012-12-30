require 'spec_helper'

describe "clicks/index" do
  before(:each) do
    assign(:clicks, [
      stub_model(Click,
        :tagname => "Tagname",
        :clicks => 1,
        :campaign => 1,
        :page => 1,
        :up_category => 1,
        :tag_type => "Tag Type"
      ),
      stub_model(Click,
        :tagname => "Tagname",
        :clicks => 1,
        :campaign => 1,
        :page => 1,
        :up_category => 1,
        :tag_type => "Tag Type"
      )
    ])
  end

  it "renders a list of clicks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tagname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tag Type".to_s, :count => 2
  end
end
