require 'spec_helper'

describe "daily_tasks/new" do
  before(:each) do
    assign(:daily_task, stub_model(DailyTask,
      :user_id => 1,
      :title => "MyString",
      :content => "MyText",
      :accomplishment => 1.5
    ).as_new_record)
  end

  it "renders new daily_task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => daily_tasks_path, :method => "post" do
      assert_select "input#daily_task_user_id", :name => "daily_task[user_id]"
      assert_select "input#daily_task_title", :name => "daily_task[title]"
      assert_select "textarea#daily_task_content", :name => "daily_task[content]"
      assert_select "input#daily_task_accomplishment", :name => "daily_task[accomplishment]"
    end
  end
end
