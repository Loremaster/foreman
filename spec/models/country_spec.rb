require 'spec_helper'

describe Country do
  before(:each) do
    @attr = { :name => "some text here" }
  end

  describe "DB" do
    it "should create a new row with valid params" do
      expect do
        country = Country.create( @attr )
      end.to change( Country, :count ).by( 1 )
    end
  end

  describe "Validations for" do
    it "name can't be empty" do
      country = Country.create( @attr.merge :name => "" )
      country.should_not be_valid
    end

    it "name can't contain > 250 symbols" do
      country = Country.create( @attr.merge :name => "a" * 251 )
      country.should_not be_valid
    end
  end
end
