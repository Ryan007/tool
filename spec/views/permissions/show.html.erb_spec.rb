require 'spec_helper'

describe "permissions/show" do
  before(:each) do
    @permission = assign(:permission, stub_model(Permission,
      :name => "Name",
      :desc => "Desc",
      :action => "Action",
      :subject_class => "Subject Class",
      :subject_id => "Subject"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Desc/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Action/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject Class/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
  end
end
