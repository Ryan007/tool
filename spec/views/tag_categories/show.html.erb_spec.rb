require 'spec_helper'

describe "tag_categories/show" do
  before(:each) do
    @tag_category = assign(:tag_category, stub_model(TagCategory,
      :name => "Name",
      :description => "MyText",
      :uid => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
