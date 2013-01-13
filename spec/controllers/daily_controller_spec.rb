require 'spec_helper'

describe DailyController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'me'" do
    it "returns http success" do
      get 'me'
      response.should be_success
    end
  end

end
