require 'spec_helper'

describe "daily_tasks/index" do
  before(:each) do
    assign(:daily_tasks, [
      stub_model(DailyTask,
        :user_id => 1,
        :title => "Title",
        :content => "MyText",
        :accomplishment => 1.5
      ),
      stub_model(DailyTask,
        :user_id => 1,
        :title => "Title",
        :content => "MyText",
        :accomplishment => 1.5
      )
    ])
  end

  it "renders a list of daily_tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
