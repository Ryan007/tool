require 'spec_helper'

describe "permissions/index" do
  before(:each) do
    assign(:permissions, [
      stub_model(Permission,
        :name => "Name",
        :desc => "Desc",
        :action => "Action",
        :subject_class => "Subject Class",
        :subject_id => "Subject"
      ),
      stub_model(Permission,
        :name => "Name",
        :desc => "Desc",
        :action => "Action",
        :subject_class => "Subject Class",
        :subject_id => "Subject"
      )
    ])
  end

  it "renders a list of permissions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Action".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject Class".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
  end
end
