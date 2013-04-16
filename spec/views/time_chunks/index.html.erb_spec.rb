require 'spec_helper'

describe "time_chunks/index" do
  before(:each) do
    assign(:time_chunks, [
      stub_model(TimeChunk,
        :source_id => "Source",
        :date_time => ""
      ),
      stub_model(TimeChunk,
        :source_id => "Source",
        :date_time => ""
      )
    ])
  end

  it "renders a list of time_chunks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Source".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
