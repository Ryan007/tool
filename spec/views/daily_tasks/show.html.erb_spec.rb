require 'spec_helper'

describe "daily_tasks/show" do
  before(:each) do
    @daily_task = assign(:daily_task, stub_model(DailyTask,
      :user_id => 1,
      :title => "Title",
      :content => "MyText",
      :accomplishment => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
  end
end
