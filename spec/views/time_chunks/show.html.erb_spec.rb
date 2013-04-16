require 'spec_helper'

describe "time_chunks/show" do
  before(:each) do
    @time_chunk = assign(:time_chunk, stub_model(TimeChunk,
      :source_id => "Source",
      :date_time => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Source/)
    rendered.should match(//)
  end
end
