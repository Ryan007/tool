require 'spec_helper'

describe "permissions/new" do
  before(:each) do
    assign(:permission, stub_model(Permission,
      :name => "MyString",
      :desc => "MyString",
      :action => "MyString",
      :subject_class => "MyString",
      :subject_id => "MyString"
    ).as_new_record)
  end

  it "renders new permission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => permissions_path, :method => "post" do
      assert_select "input#permission_name", :name => "permission[name]"
      assert_select "input#permission_desc", :name => "permission[desc]"
      assert_select "input#permission_action", :name => "permission[action]"
      assert_select "input#permission_subject_class", :name => "permission[subject_class]"
      assert_select "input#permission_subject_id", :name => "permission[subject_id]"
    end
  end
end
