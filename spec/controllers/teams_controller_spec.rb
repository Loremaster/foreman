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

  describe "GET 'edit'" do
    it "should access page" do
      team = FactoryGirl.create( :team )

      get :edit, :id => team
      response.should be_success
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @team = FactoryGirl.create(:team)
      @attrs = { :name => "name2", :country_id => @team.country_id, :people_count => @team.people_count, :price => @team.price }
    end

    it "should update" do
      put :update, :id => @team, :team => @attrs
      @team.reload
      @team.name.should == @attrs[:name]
    end

    it "redirects to index page after update" do
      put :update, :id => @team, :team => @attrs
      response.should redirect_to(teams_path)
    end
  end
end
