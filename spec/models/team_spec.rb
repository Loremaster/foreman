require 'spec_helper'

describe Team do
  before(:each) do
    country = Country.create( :name => "name" )
    @attr = { :name => "some text here", :people_count => 5, :price => 100, :country_id => country.id, :tag_list => "painting" }
  end

  describe "DB" do
    it "should create a new row with valid params" do
      expect do
        team = Team.create( @attr )
      end.to change( Team, :count ).by( 1 )
    end
  end

  describe "Validations for" do
    it "name can't be empty" do
      team = Team.create( @attr.merge :name => "" )
      team.should_not be_valid
    end

    it "name can't contain > 250 symbols" do
      team = Team.create( @attr.merge :name => "a" * 251 )
      team.should_not be_valid
    end

    it "people_count should exists" do
      team = Team.create( @attr.merge :people_count => nil )
      team.should_not be_valid
    end

    it "people_count should be integer, not float" do
      team = Team.create( @attr.merge :people_count => 1.10 )
      team.should_not be_valid
    end

    it "people_count should be integer, not string" do
      team = Team.create( @attr.merge :people_count => "abc" )
      team.should_not be_valid
    end

    it "people_count should not accept 0" do
      team = Team.create( @attr.merge :people_count => 0 )
      team.should_not be_valid
    end

    it "people_count should not accept 101" do
      team = Team.create( @attr.merge :people_count => 101 )
      team.should_not be_valid
    end

    it "price should exists" do
      team = Team.create( @attr.merge :price => nil )
      team.should_not be_valid
    end

    it "price should be integer, not float" do
      team = Team.create( @attr.merge :price => 1.01 )
      team.should_not be_valid
    end

    it "price should be integer, not string" do
      team = Team.create( @attr.merge :price => "abc" )
      team.should_not be_valid
    end

    it "price should not accept 0" do
      team = Team.create( @attr.merge :price => 0 )
      team.should_not be_valid
    end

    it "price should not accept 100_000_001" do
      team = Team.create( @attr.merge :price => 100_000_001 )
      team.should_not be_valid
    end

    it "country_id should not be nil" do
      team = Team.create( @attr.merge :country_id => nil )
      team.should_not be_valid
    end

    it "tag_list should not accept 0 tags" do
      team = Team.create( @attr.merge :tag_list => "" )
      team.should_not be_valid
    end

    it "tag_list should accept 1 tag" do
      team = Team.create( @attr.merge :tag_list => "some" )
      team.should be_valid
    end

    it "tag_list should accept 2 tags" do
      team = Team.create( @attr.merge :tag_list => "some, thing" )
      team.should be_valid
    end
  end

  describe "Methods" do
    it "tags_with_nums should return correct array" do
      2.times { FactoryGirl.create(:team) }
      FactoryGirl.create(:team, :tag_list => "draw")

      Team.tags_with_nums.should == [["painting",2], ["draw",1]]
    end
  end
end
