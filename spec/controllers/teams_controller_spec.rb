require 'spec_helper'

describe TeamsController do
  describe "GET 'index'" do
    it "should access page without teams" do
      get :index
      response.should be_success
    end

    it "should access page with 1 team" do
      FactoryGirl.create( :team )

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

  describe "POST 'create'" do
    it "should create" do
      country = Country.create( :name => "USA" )

      expect do
        post :create, :team => { :name => "Metal", :country_id => country.id, :people_count => 45, :price => 450 }
      end.to change( Team, :count ).by(1)
    end
  end
end
