require 'spec_helper'

describe TeamsController do
  describe "GET 'index'" do
    it "should access" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should access" do
      get :new
      response.should be_success
    end
  end
end
