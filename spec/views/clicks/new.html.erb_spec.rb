require 'spec_helper'

describe "clicks/new" do
  before(:each) do
    assign(:click, stub_model(Click,
      :tagname => "MyString",
      :clicks => 1,
      :campaign => 1,
      :page => 1,
      :up_category => 1,
      :tag_type => "MyString"
    ).as_new_record)
  end

  it "renders new click form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clicks_path, :method => "post" do
      assert_select "input#click_tagname", :name => "click[tagname]"
      assert_select "input#click_clicks", :name => "click[clicks]"
      assert_select "input#click_campaign", :name => "click[campaign]"
      assert_select "input#click_page", :name => "click[page]"
      assert_select "input#click_up_category", :name => "click[up_category]"
      assert_select "input#click_tag_type", :name => "click[tag_type]"
    end
  end
end
