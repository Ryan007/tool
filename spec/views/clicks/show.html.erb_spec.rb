require 'spec_helper'

describe "clicks/show" do
  before(:each) do
    @click = assign(:click, stub_model(Click,
      :tagname => "Tagname",
      :clicks => 1,
      :campaign => 1,
      :page => 1,
      :up_category => 1,
      :tag_type => "Tag Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tagname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tag Type/)
  end
end
