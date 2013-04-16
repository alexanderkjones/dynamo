require 'spec_helper'

describe ControllerController do

  describe "GET 'time_chunks_controller'" do
    it "returns http success" do
      get 'time_chunks_controller'
      response.should be_success
    end
  end

end
