require 'spec_helper'

describe "permissions/edit" do
  before(:each) do
    @permission = assign(:permission, stub_model(Permission,
      :name => "MyString",
      :desc => "MyString",
      :action => "MyString",
      :subject_class => "MyString",
      :subject_id => "MyString"
    ))
  end

  it "renders the edit permission form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => permissions_path(@permission), :method => "post" do
      assert_select "input#permission_name", :name => "permission[name]"
      assert_select "input#permission_desc", :name => "permission[desc]"
      assert_select "input#permission_action", :name => "permission[action]"
      assert_select "input#permission_subject_class", :name => "permission[subject_class]"
      assert_select "input#permission_subject_id", :name => "permission[subject_id]"
    end
  end
end
